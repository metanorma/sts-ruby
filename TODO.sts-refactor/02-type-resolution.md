# 02: Type Resolution Anti-Pattern Fix

**Priority**: HIGH
**Category**: Anti-Pattern Elimination
**Estimated Effort**: Low
**Files Affected**: `lib/sts/content_groups/helpers.rb`

## Problem

Current `lib/sts/content_groups/helpers.rb` uses `Object.const_get` for type resolution:

```ruby
def inject_elements(klass, elements)
  elements.each do |name, type_name, _, is_collection|
    type = Object.const_get(type_name)  # Anti-pattern
    coll = is_collection.nil? || is_collection
    klass.attribute name, type, collection: coll
  end
end
```

### Why This Is Wrong

1. **`Object.const_get`**: String-based lookup, no compile-time checking, fragile to typos
2. **Hidden dependency**: No `require` statement indicates the dependency
3. **Security risk**: Can resolve arbitrary constants if input is user-controlled
4. **Performance**: Resolved at runtime, not cached efficiently

## Solution

### Option A: Direct Constant Reference

Pass actual class objects instead of strings:

```ruby
module Sts
  module ContentGroups
    module Helpers
      module_function

      # Elements is now [[:attribute_name, Class, nil, is_collection?], ...]
      def inject_elements(klass, elements)
        elements.each do |name, type, _, is_collection|
          coll = is_collection.nil? || is_collection
          klass.attribute name, type, collection: coll
        end
      end

      def inject_element_mappings(klass, mappings)
        mappings.each do |xml_name, type, ruby_name|
          klass.xml { map_element xml_name, to: ruby_name }
        end
      end
    end
  end
end
```

### Option B: Register-Based Resolution

Use lutaml-model's register system:

```ruby
module Sts
  module ContentGroups
    module Helpers
      module_function

      def resolve_type(type_identifier)
        case type_identifier
        when Module then type_identifier
        when Symbol
          Lutaml::Model::GlobalRegister.resolve(type_identifier) ||
            raise(ArgumentError, "Unknown type: #{type_identifier}")
        else
          raise(TypeError, "Expected Module or Symbol, got #{type_identifier.class}")
        end
      end

      def inject_elements(klass, elements)
        elements.each do |name, type, _, is_collection|
          resolved_type = resolve_type(type)
          coll = is_collection.nil? || is_collection
          klass.attribute name, resolved_type, collection: coll
        end
      end
    end
  end
end
```

## Files Using This Helper

Need to update all callers to pass class objects:

```bash
grep -r "inject_elements\|inject_element_mappings" lib/sts/
```

Expected to find calls in:
- `lib/sts/iso_sts/content_groups/*.rb`
- `lib/sts/niso_sts/content_groups/*.rb`

## Verification

1. All callers pass actual class constants, not strings
2. `bundle exec rubocop lib/sts/content_groups/helpers.rb` passes
3. All specs pass — types resolved at class definition time

## Dependencies

None — can be done independently.

## TODO Checklist

- [ ] Read `lib/sts/content_groups/helpers.rb`
- [ ] Find all callers: `grep -r "inject_elements\|inject_element_mappings" lib/sts/`
- [ ] Choose Option A or B
- [ ] Update helper methods
- [ ] Update all callers to pass class objects
- [ ] Verify no `Object.const_get` remains
- [ ] Run full test suite

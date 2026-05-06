# 03: Namespace Coupling Architecture Fix

**Priority**: HIGH
**Category**: Architecture
**Estimated Effort**: High
**Files Affected**: `lib/sts/iso_sts/content_groups/highlight_elements.rb` (194+ references)

## Problem

`lib/sts/iso_sts/content_groups/highlight_elements.rb` contains 194+ references to `Sts::NisoSts::*` types:

```ruby
# Examples from highlight_elements.rb
[:sub, "Sts::NisoSts::Sub", "sub"]
[:sup, "Sts::NisoSts::Sup", "sup"]
[:italic, "Sts::NisoSts::Italic", "italic"]
[:bold, "Sts::NisoSts::Bold", "bold"]
# ... 190 more
```

### Why This Is Wrong

1. **Violation of namespace isolation**: IsoSts should not depend on NisoSts implementation
2. **Shared-namespace ambiguity**: These elements appear in both ISOSTS and NISO STS but with different attribute sets
3. **Tight coupling**: Changes to NisoSts can break IsoSts
4. **Schema divergence ignored**: `<p>` in ISOSTS has different attributes than `<p>` in NISO STS Extended

### Root Cause

The schemas ARE different:
- ISOSTS `<p>`: `@content-type, @id, @specific-use, @xml:lang`
- NISO STS Extended `<p>`: `@content-type, @id, @originator, @specific-use, @style-type, @xml:base, @xml:lang`

## Solution: Three-Tier Architecture

### Tier 1: Shared Base Types

Create shared types in `Sts::Base` that both namespaces inherit:

```ruby
# lib/sts/base/text/emphasis.rb
module Sts
  module Base
    module Text
      class Emphasis < Lutaml::Model::Serializable
        # Shared attributes/methods
        attribute :id, :string
        attribute :base_fontsize, :string
        attribute :baseline_shift, :string
        attribute :color, :string

        xml do
          map_attribute :id, to: :id
          # ...
        end
      end

      class Bold < Emphasis
        xml { element "bold" }
      end

      class Italic < Emphasis
        xml { element "italic" }
      end

      class Sub < Emphasis
        xml { element "sub" }
      end

      class Sup < Emphasis
        xml { element "sup" }
      end
    end
  end
end
```

### Tier 2: IsoSts-Specific Extensions

```ruby
# lib/sts/iso_sts/text/emphasis.rb
module Sts
  module IsoSts
    module Text
      class Bold < ::Sts::Base::Text::Bold
        # Add IsoSts-specific attributes
        attribute :content_type, :string

        xml do
          # Override/add IsoSts-specific mapping
          map_attribute "content-type", to: :content_type
        end
      end
    end
  end
end
```

### Tier 3: NisoSts-Specific Extensions

```ruby
# lib/sts/niso_sts/text/emphasis.rb
module Sts
  module NisoSts
    module Text
      class Bold < ::Sts::Base::Text::Bold
        # Add NisoSts-specific attributes
        attribute :originator, :string
        attribute :style_type, :string

        xml do
          map_attribute "originator", to: :originator
          map_attribute "style-type", to: :style_type
        end
      end
    end
  end
end
```

## Implementation Strategy

1. **Phase 1**: Identify all shared element types (bold, italic, sub, sup, p, etc.)
2. **Phase 2**: Create base types with MINIMAL shared attributes
3. **Phase 3**: Refactor IsoSts to extend bases
4. **Phase 4**: Refactor NisoSts to extend bases
5. **Phase 5**: Delete `Sts::NisoSts::*` references from IsoSts content groups

## Files to Refactor

Primary targets:
- `lib/sts/iso_sts/content_groups/highlight_elements.rb`
- `lib/sts/iso_sts/content_groups/emphasis_elements.rb` (if exists)
- `lib/sts/niso_sts/content_groups/highlight_elements.rb`

## Verification

1. No `Sts::NisoSts` references in `lib/sts/iso_sts/`
2. All round-trip tests pass
3. Schema validation against both ISOSTS DTD and NISO STS XSD passes

## Dependencies

- `01-mathml-delegation.md` — uses similar patterns
- `02-type-resolution.md` — must be clean first

## TODO Checklist

- [ ] Audit all IsoSts → NisoSts references
- [ ] Categorize by shared vs. truly namespace-specific
- [ ] Design base type hierarchy
- [ ] Create `lib/sts/base/` directory structure
- [ ] Implement base types for shared elements
- [ ] Refactor IsoSts to use base types
- [ ] Refactor NisoSts to use base types
- [ ] Remove cross-namespace references
- [ ] Verify no circular dependencies
- [ ] Run full test suite

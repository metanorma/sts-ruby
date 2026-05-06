# 01: MathML Delegation Anti-Pattern Fix

**Priority**: CRITICAL
**Category**: Anti-Pattern Elimination
**Estimated Effort**: Medium
**Files Affected**: `lib/sts/mathml.rb`

## Problem

Current `lib/sts/mathml.rb` uses three anti-patterns that violate encapsulation:

```ruby
# Anti-Pattern 1: method_missing delegates everything to wrapped object
def method_missing(method_name, *args, &block)
  if math.respond_to?(method_name)
    math.send(method_name, *args, &block)
  else
    super
  end
end

# Anti-Pattern 2: respond_to checks wrapped object internals
def respond_to_missing?(method_name, include_private = false)
  math.respond_to?(method_name, include_private) || super
end

# Anti-Pattern 3: send bypasses encapsulation
math.send(method_name, *args, &block)
```

### Why These Are Wrong

1. **`method_missing`**: Hides interface boundary, makes IDE/tools blind to actual API, creates invisible coupling
2. **`respond_to_missing?`**: Returns false positives for private/internal methods, breaks type checking
3. **`send`**: Bypasses access control, breaks encapsulation, no warning for private method calls

### Impact

- Debugging is harder — no clear call stack
- Static analysis tools (RuboCop, Sorbet) cannot understand the interface
- Mix of `method_missing` and explicit method definitions creates inconsistency
- Performance: `send` is slower than direct calls

## Solution

Replace delegation with **explicit forwarding** or **composition via inheritance** following the mml gem's register pattern.

### Option A: Explicit Forwardable (Preferred)

Create explicit delegation methods for the API we actually need:

```ruby
module Sts
  module Mathml
    class Math < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :display, :string
      attribute :math, Mml::V3::Math
      attribute :class, :string
      attribute :style, :string
      attribute :xref, :string
      attribute :encoding, :string
      attribute :maxsize, :string
      attribute :minsize, :string
      attribute :other, :string
      attribute :otherpr, :string

      xml do
        namespace ::Sts::Namespaces::MathmlNamespace
        element "math"
        mixed_content
        map_attribute :id, to: :id
        map_attribute :display, to: :display
        map_attribute :class, to: :class
        map_attribute :style, to: :style
        map_attribute :xref, to: :xref
        map_attribute "encoding", to: :encoding
        map_attribute "maxsize", to: :maxsize
        map_attribute "minsize", to: :minsize
        map_attribute "other", to: :other
        map_attribute "otherpr", to: :otherpr
        map_element "math", to: :math
      end

      # Delegate children/annotations explicitly
      def children
        math.children
      end

      def to_xml(*args)
        math.to_xml(*args)
      end

      def self.from_xml(input)
        parsed = Mml::V3::Math.from_xml(input)
        new(
          id: parsed.id,
          display: parsed.display,
          math: parsed
        )
      end
    end
  end
end
```

### Option B: Forwardable Module

Use Ruby's `Forwardable` module for cleaner delegation:

```ruby
require 'forwardable'

module Sts
  module Mathml
    class Math < Lutaml::Model::Serializable
      extend Forwardable

      attribute :id, :string
      attribute :display, :string
      attribute :math, Mml::V3::Math

      def_delegators :math, :children, :to_xml, :to_json
      def_delegators :math, :id=, :display=

      xml do
        # ... xml mapping
      end
    end
  end
end
```

## Verification

After fix, ensure:
1. `bundle exec rubocop lib/sts/mathml.rb` passes with no Style/Send, Style/MethodMissing violations
2. `bundle exec rspec spec/` round-trip tests pass for MathML content
3. Reference doc `C070908e.xml` parses and serializes correctly

## Dependencies

None — can be done independently.

## TODO Checklist

- [ ] Read current `lib/sts/mathml.rb`
- [ ] Identify all methods actually called on `Mml::V3::Math` in codebase
- [ ] Implement Option A or B
- [ ] Update `lib/sts/mathml.rb`
- [ ] Verify rubocop: no anti-pattern warnings
- [ ] Run round-trip tests
- [ ] Test C070908e.xml specifically

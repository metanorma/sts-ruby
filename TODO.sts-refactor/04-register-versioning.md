# 04: Schema Versioning via lutaml-model Registers

**Priority**: HIGH
**Category**: Architecture
**Estimated Effort**: Very High
**Files Affected**: New architecture, all model files

## Problem

Currently sts-ruby uses flat module namespaces (`IsoSts`, `NisoSts`) with no versioning. Real-world standards have multiple schema versions that differ in element sets and attributes:

- **ISOSTS v1.1** (2013, frozen DTD)
- **NISO STS 1.0** (2017, DTD/XSD/RNG, interchange + extended)
- **NISO STS 1.2** (2022, backwards compatible with NISO STS 1.0)

Schema differences exist on the same element names (e.g., `<p>` attributes differ between ISOSTS and NISO STS Extended).

## Reference: mml Gem Pattern

The mml gem provides the correct versioning architecture:

```
mml/
├── lib/mml.rb                    # Top-level entry, requires version modules
├── lib/mml/
│   ├── base/                     # Shared mixins via `included` hook
│   │   ├── math.rb               # Mml::Base::Math module
│   │   ├── mi.rb                 # Mml::Base::Mi module
│   │   └── ...
│   ├── v2/                       # MathML 2.0 versioned classes
│   │   ├── math.rb               # Mml::V2::Math < Serializable; includes Mml::Base::Math
│   │   ├── mi.rb                 # Mml::V2::Mi < Serializable; includes Mml::Base::Mi
│   │   └── configuration.rb      # Mml::V2::Configuration with CONTEXT_ID = :mml_v2
│   ├── v3/                       # MathML 3.0 versioned classes
│   │   ├── math.rb               # Mml::V3::Math < Serializable; includes Mml::Base::Math
│   │   ├── configuration.rb      # Mml::V3::Configuration with CONTEXT_ID = :mml_v3
│   │   └── ...
│   └── configuration.rb          # Mml::Configuration, dispatches to version
```

### Key Mechanisms

1. **Register per version**: Each version creates a `Lutaml::Model::Register` with unique ID
2. **`lutaml_default_register`**: Class method on each versioned class points to its register
3. **Shared modules**: `Mml::Base::*` mixins define shared attributes/behavior via `included` hook
4. **Version-specific classes**: `Mml::V3::Math` extends shared module with V3-specific attributes

```ruby
# From mml gem
module Mml
  module V3
    class Configuration
      CONTEXT_ID = :mml_v3

      def self.register_model(klass, id:)
        register = Lutaml::Model::Register.new(id: CONTEXT_ID)
        register.register_model(klass, id: id)
        klass.define_singleton_method(:lutaml_default_register) { register }
      end
    end
  end
end
```

## Proposed Architecture for sts-ruby

```
lib/sts/
├── base/                         # Shared element modules (Tier 1)
│   ├── text/                     # Bold, Italic, Sub, Sup, etc.
│   ├── struct/                   # Section, Paragraph, List, etc.
│   ├── meta/                     # Title, Label, Caption, etc.
│   └── refs/                     # Xref, BiblioRef, etc.
├── iso_sts/                      # ISOSTS v1.1 (frozen)
│   ├── v1_1/                     # ISOSTS v1.1 classes
│   │   ├── standard.rb           # IsoSts::V1_1::Standard
│   │   ├── paragraph.rb          # IsoSts::V1_1::Paragraph (ISOSTS-specific attributes)
│   │   └── configuration.rb      # IsoSts::V1_1::Configuration
│   └── iso_sts.rb
├── niso_sts/                     # NISO STS (evolving)
│   ├── v1_0/                     # NISO STS 1.0 classes
│   │   ├── standard.rb           # NisoSts::V1_0::Standard
│   │   ├── paragraph.rb          # NisoSts::V1_0::Paragraph
│   │   └── configuration.rb      # NisoSts::V1_0::Configuration
│   ├── v1_2/                     # NISO STS 1.2 classes (extends v1_0)
│   │   ├── processing_meta.rb    # New in 1.2
│   │   ├── code.rb               # New in 1.2
│   │   ├── standard.rb           # NisoSts::V1_2::Standard (adds processing-meta)
│   │   └── configuration.rb      # NisoSts::V1_2::Configuration
│   └── niso_sts.rb
├── tbx_iso_tml/                  # TBX (versioned with ISO 30042)
└── sts.rb                        # Top-level entry point
```

### Register Registration Pattern

```ruby
module Sts
  module NisoSts
    module V1_0
      class Configuration
        CONTEXT_ID = :niso_sts_v1_0

        def self.setup!
          register = Lutaml::Model::Register.new(id: CONTEXT_ID)
          # Register all V1_0 models
          Dir[File.join(__dir__, '*.rb')].sort.each do |f|
            require f
          end
          # Set default register for each class
          constants.each do |c|
            klass = const_get(c)
            next unless klass.is_a?(Class) && klass < Lutaml::Model::Serializable
            klass.define_singleton_method(:lutaml_default_register) { register }
          end
        end
      end
    end
  end
end
```

## Migration Strategy

### Phase 1: Create Register Infrastructure
- Create `Sts::Configuration` with register setup
- Create base register for `:iso_sts_v1_1` and `:niso_sts_v1_0`

### Phase 2: Create Base Types
- Extract shared elements from both namespaces into `Sts::Base::*`
- See `03-namespace-coupling.md` for details

### Phase 3: Version the Models
- Rename current `Sts::IsoSts::*` → `Sts::IsoSts::V1_1::*`
- Rename current `Sts::NisoSts::*` → `Sts::NisoSts::V1_0::*`
- Set `lutaml_default_register` on each versioned class

### Phase 4: Backward Compatibility Shims
- Provide temporary aliases at current paths:
  ```ruby
  module Sts
    module IsoSts
      # Temporary backward compat - remove in next major version
      Standard = V1_1::Standard
    end
  end
  ```
- Mark for deprecation in next major release

### Phase 5: Add NISO STS 1.2 Support
- Create `Sts::NisoSts::V1_2` namespace
- Extend V1_0 models with 1.2 additions
- See `05-missing-elements.md` for NISO STS 1.2 additions

## Verification

1. `bundle exec rspec` passes with versioned model loading
2. ISOSTS documents parse with ISOSTS register
3. NISO STS 1.0 documents parse with NISO STS 1.0 register
4. No cross-register contamination

## Dependencies

- `01-mathml-delegation.md` — MathML already follows this pattern
- `02-type-resolution.md` — Register provides type resolution
- `03-namespace-coupling.md` — Base types needed for versioning

## TODO Checklist

- [ ] Read `lutaml-model` register/global_register source
- [ ] Read mml gem's versioning pattern fully
- [ ] Design sts-ruby register architecture
- [ ] Create `Sts::Configuration` with register setup
- [ ] Phase 1: Register infrastructure
- [ ] Phase 2: Base types (coordinated with 03-namespace-coupling)
- [ ] Phase 3: Version models
- [ ] Phase 4: Backward compat shims
- [ ] Phase 5: NISO STS 1.2 support
- [ ] Update tests for versioned parsing
- [ ] Document API changes

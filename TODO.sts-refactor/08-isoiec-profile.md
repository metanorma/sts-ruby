# 08: ISO/IEC Usage Profile Layer

**Priority**: MEDIUM
**Category**: Architecture
**Estimated Effort**: High
**Files Affected**: New module

## Context

ISO/IEC NISO STS is NOT a separate schema. It is a **usage profile** — a constraint layer on top of NISO STS that specifies:
- Which elements are required vs. optional
- Which attribute values are allowed
- How to use elements in ISO/IEC context
- Additional conventions (ID schemes, committee references, etc.)

This means we should NOT create separate model classes for ISO/IEC. Instead, we need a **validation/constraint layer**.

## Reference Sources

- `reference-docs/Guidelines for coding ed.2.1.pdf` — IEC/ISO Coding Guidelines ed.2.1
- ISO/IEC Directives Part 2 — document structure rules
- NISO STS Tag Library — element definitions

## Architecture: Validation Layer

### Option A: Dry-Validation Schema

```ruby
# lib/sts/profiles/iso_iec/validator.rb
module Sts
  module Profiles
    module IsoIec
      class Validator
        def initialize(register = :niso_sts_v1_0)
          @register = register
        end

        def validate(document)
          errors = []
          errors.concat(validate_structure(document))
          errors.concat(validate_ids(document))
          errors.concat(validate_metadata(document))
          errors.concat(validate_references(document))
          errors
        end

        private

        def validate_structure(doc)
          errors = []
          # ISO/IEC requires <front>, <body> in <standard>
          unless doc.front
            errors << "ISO/IEC profile requires <front> in <standard>"
          end
          unless doc.body
            errors << "ISO/IEC profile requires <body> in <standard>"
          end
          errors
        end

        def validate_ids(doc)
          # ISO/IEC: all <sec> must have @id matching pattern sec_N
          # ISO/IEC: all <fig> must have @id matching pattern fig_N
          # etc.
        end

        def validate_metadata(doc)
          # ISO/IEC: <std-meta> must have <std-ident> with specific children
          # ISO/IEC: committee reference format
        end

        def validate_references(doc)
          # ISO/IEC: <std> references must have dated/undated format
        end
      end
    end
  end
end
```

### Option B: Profile Module with Class Methods

```ruby
# lib/sts/profiles/iso_iec/constraints.rb
module Sts
  module Profiles
    module IsoIec
      module Constraints
        # Elements that MUST have @id
        REQUIRED_ID_ELEMENTS = %i[
          sec app fig table-wrap disp-formula
          ref-list ref p term-sec
        ].freeze

        # Required children of <std-meta>
        REQUIRED_STD_META_CHILDREN = %i[
          std-ident doc-ref release-version
        ].freeze

        # Allowed values for @std-id-type
        STD_ID_TYPES = %w[
          dated undated isbn doi
        ].freeze
      end
    end
  end
end
```

### Option C: Custom lutaml-model Validation

Extend lutaml-model's validation to support profile-specific rules:

```ruby
# This would require lutaml-model changes — consider for future
class Sts::NisoSts::Standard
  validates :front, presence: { message: "required by ISO/IEC profile" },
    if: -> { iso_iec_profile? }
end
```

## Recommended Approach

Start with **Option B** (constraint constants) as a documentation layer, then build **Option A** (validator) on top. This avoids coupling validation to the model classes themselves.

## Profile Differences to Capture

### ISO Documents
- `<std-ident>` with `<originator>ISO</originator>`
- Committee reference format: `TC/SC/WG`
- Stage codes per ISO harmonized system

### IEC Documents
- `<std-ident>` with `<originator>IEC</originator>`
- Different committee reference format
- Copyright statement with inline-graphic

### National Adoptions
- `<std-doc-meta>` wrapper for national metadata
- `<adopted-from>` reference to international standard

## Files to Create

```
lib/sts/profiles/
├── iso_iec/
│   ├── constraints.rb       # Constraint constants
│   ├── validator.rb         # Validation logic
│   ├── id_scheme.rb         # ID naming conventions
│   └── metadata_rules.rb    # Metadata requirements
└── profiles.rb              # Entry point
```

## Dependencies

- `04-register-versioning.md` — needs to know which schema version to validate against

## TODO Checklist

- [x] Extract ISO/IEC constraints from Guidelines ed.2.1
- [ ] Extract IEC-specific constraints
- [x] Design validator architecture
- [x] Implement constraint constants module
- [x] Implement basic structural validator
- [ ] Implement ID scheme validator
- [x] Implement metadata validator (originator, doc-type validation)
- [ ] Add profile selection to parsing API
- [x] Write specs for validation
- [ ] Document usage

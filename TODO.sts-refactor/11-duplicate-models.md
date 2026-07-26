# 11: Duplicate Model Resolution

**Status**: REJECTED (2026-07-26) — kept for historical context.
**Priority**: N/A
**Category**: Architecture
**Estimated Effort**: N/A
**Files Affected**: `lib/sts/iso_sts/`, `lib/sts/niso_sts/`

## Why rejected

The "Resolution Strategy" below proposes a `Sts::Base::*` three-tier class
hierarchy that both `IsoSts` and `NisoSts` inherit from. This contradicts:

- The 2026-05-07 ADR on namespace independence.
- `TODO.sts-refactor/03-namespace-coupling.md` "Rejected" section.
- The project-global memory `architecture-namespace-independence`:
  "NEVER create shared `Sts::Base` classes that both namespaces inherit from".

The schemas genuinely diverge — `IsoSts::Fig` has `title`/`alternatives` that
`NisoSts::Figure` lacks; `IsoSts::Ref` has `nlm-citation`/`citation-alternatives`
that `NisoSts::Reference` lacks. A shared base would fight the schemas and
violate the Open/Closed Principle.

The "duplicate" classes between IsoSts and NisoSts are intentional: each
namespace must have its own complete, independent set of model classes
modelled from its own schema (ISOSTS.xsd vs NISO-STS-extended-1.xsd). The
correct way to reduce the duplication appearance is to finish TODO 03
(model IsoSts classes from ISOSTS.xsd, replacing NisoSts references),
not to share base types.

The rest of this document is preserved for reference only. **Do not implement
the proposals below.**

---

## Original problem statement (rejected)

## Problem

Many model classes exist in both `Sts::IsoSts` and `Sts::NisoSts` with the same XML element name but potentially different attributes. This creates:

1. **Maintenance burden**: Changes must be duplicated
2. **Divergence risk**: Models drift apart over time
3. **Ambiguity**: Which class should be used?

## Identified Duplicates

### Confirmed Different (Must Stay Separate)

These elements have genuinely different attribute sets between ISOSTS and NISO STS:

| Element | IsoSts Version | NisoSts Version | Difference |
|---------|---------------|----------------|------------|
| `<p>` | Paragraph | Paragraph | ISOSTS: 4 attrs; NISO STS: 7 attrs (adds `@originator`, `@style-type`, `@xml:base`) |
| `<standard>` | Standard | Standard | ISOSTS: DTD-based; NISO STS: XSD-based |

### Potentially Identical (Audit Needed)

These elements likely have the same model but are duplicated:

| Element | IsoSts File | NisoSts File |
|---------|-------------|--------------|
| `<bold>` | Bold | Bold |
| `<italic>` | Italic | Italic |
| `<sub>` | Sub | Sub |
| `<sup>` | Sup | Sup |
| `<underline>` | Underline | Underline |
| `<monospace>` | Monospace | Monospace |
| `<styled-content>` | StyledContent | StyledContent |
| `<named-content>` | NamedContent | NamedContent |
| `<xref>` | Xref | Xref |
| `<ext-link>` | ExtLink | ExtLink |
| `<break>` | Break | Break |
| `<list>` | List | List |
| `<list-item>` | ListItem | ListItem |
| `<def-list>` | DefList | DefList |
| `<def-item>` | DefItem | DefItem |
| `<table>` | Table | Table |
| `<tr>` | Tr | Tr |
| `<td>` | Td | Td |
| `<th>` | Th | Th |
| `<fig>` | Fig | Fig |
| `<graphic>` | Graphic | Graphic |
| `<caption>` | Caption | Caption |
| `<title>` | Title | Title |
| `<label>` | Label | Label |
| `<disp-formula>` | DispFormula | DispFormula |
| `<inline-formula>` | InlineFormula | InlineFormula |

## Resolution Strategy

### For Genuinely Different Models

Keep separate but share a base class:

```ruby
# lib/sts/base/paragraph.rb
module Sts
  module Base
    class Paragraph < Lutaml::Model::Serializable
      # Shared attributes common to ISOSTS and NISO STS
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string

      xml do
        element "p"
        mixed_content
        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        # Children injected by content groups
      end
    end
  end
end

# lib/sts/iso_sts/paragraph.rb
module Sts
  module IsoSts
    class Paragraph < ::Sts::Base::Paragraph
      # ISOSTS-specific: only 4 attrs
      attribute :xml_lang, :string

      xml do
        root "p"
        map_attribute "xml:lang", to: :xml_lang
      end
    end
  end
end

# lib/sts/niso_sts/paragraph.rb
module Sts
  module NisoSts
    class Paragraph < ::Sts::Base::Paragraph
      # NISO STS Extended: 7 attrs
      attribute :xml_lang, :string
      attribute :xml_base, :string
      attribute :originator, :string
      attribute :style_type, :string

      xml do
        root "p"
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "xml:base", to: :xml_base
        map_attribute "originator", to: :originator
        map_attribute "style-type", to: :style_type
      end
    end
  end
end
```

### For Identical Models

Use the base class directly — no namespace-specific subclass needed:

```ruby
# Both IsoSts and NisoSts can use Sts::Base::Bold
# Remove Sts::IsoSts::Bold and Sts::NisoSts::Bold
# Add alias in each namespace if needed for API compatibility
module Sts
  module IsoSts
    Bold = ::Sts::Base::Bold
  end
  module NisoSts
    Bold = ::Sts::Base::Bold
  end
end
```

## Audit Process

For each duplicate pair:

1. Read ISOSTS DTD definition of the element
2. Read NISO STS XSD definition of the element
3. Compare attributes and children
4. Categorize: identical, subset, or different
5. Decide: share base, extend base, or keep separate

## Dependencies

- `03-namespace-coupling.md` — base type creation
- `04-register-versioning.md` — versioned class hierarchy

## TODO Checklist

- [ ] Audit all duplicate model pairs (25+ elements)
- [ ] Categorize each pair: identical / subset / different
- [ ] Create base classes for genuinely shared types
- [ ] Refactor ISOSTS versions to extend bases
- [ ] Refactor NISO STS versions to extend bases
- [ ] Replace direct references with namespace aliases where identical
- [ ] Remove duplicate implementations
- [ ] Run full round-trip test suite
- [ ] Verify no behavioral changes

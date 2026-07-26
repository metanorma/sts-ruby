# D.10: IsoSts common-attribute module (DRY within namespace)

**Status**: proposal. Needs approval before implementing.
**Estimated effort**: medium (touches ~50 classes).

## Problem

Many IsoSts classes share the same attribute set:

| Pattern | Attributes | Used by |
|---|---|---|
| Date parts | `id content_type specific_use xml_lang` | Day, Month, Season, Etal (partial) |
| Contact (simple) | `id content_type specific_use content` | Phone, Fax |
| xlink extension | `xlink_type xlink_href xlink_role xlink_title xlink_show xlink_actuate` | Abbrev, Email, ExtLink, Institution, InlineGraphic, MixedCitation |
| Citation-common | `id content_type specific_use xml_lang originator` | (various) |

This is fine-grained duplication. Each class is ~20-30 lines, mostly
attribute declarations. A single attribute rename across the schema (e.g.,
`xml:lang` semantics change) requires updating 30+ files.

## Proposal

Within the IsoSts namespace only (NOT cross-namespace — that's forbidden
by the ADR), define modules:

```ruby
module Sts
  module IsoSts
    module CommonAttributes
      # XLink attributes — included into classes that wrap XLink-extending elements
      module Xlink
        def self.included(base)
          base.class_eval do
            attribute :xlink_type, :string
            attribute :xlink_href, :string
            attribute :xlink_role, :string
            attribute :xlink_title, :string
            attribute :xlink_show, :string
            attribute :xlink_actuate, :string
          end
        end
      end

      # Common attrs for simple text-with-id elements
      module TextWithId
        def self.included(base)
          base.class_eval do
            attribute :id, :string
            attribute :content_type, :string
            attribute :specific_use, :string
            attribute :xml_lang, :string
            attribute :content, :string, collection: true
          end
        end
      end
    end
  end
end
```

Then:

```ruby
class Abbrev < Lutaml::Model::Serializable
  include IsoSts::CommonAttributes::Xlink
  # ... class-specific attrs
end
```

## Trade-off

**Pros**:
- DRY at the attribute-declaration level
- Single source of truth for common attribute sets
- Easier to evolve (rename `xml_lang` → `xml_lang_attr` once)
- Same pattern as `Mml::Base::CommonAttributes` in the mml gem

**Cons**:
- Adds indirection — readers must look at the module to know which attrs a
  class has
- Mapping (`map_attribute "xml:lang", to: :xml_lang`) still needs to be
  declared per class
- Risk of "module soup" if too many tiny modules are introduced

## Decision needed

This is a judgment call. The duplication today is annoying but not
critical. The mml gem's precedent suggests the pattern is viable.

Recommendation: **defer** until the namespace-coupling work (B.03, B.04)
is complete. Doing it now would create churn on classes that are about to
change anyway.

## How to apply (if approved)

1. Start with one module (XLink) — covers 5+ classes, lowest risk
2. Convert one class, run tests, repeat
3. Each conversion is its own commit (small, reviewable)
4. Stop if the indirection starts hurting readability

## Verification

- All existing specs still pass
- No spec needs to change (attribute-set assertions should be unchanged —
  the module just provides the attribute declarations, the class still
  exposes the same keys)
- Rubocop clean

## Anti-pattern note

This proposal does NOT introduce cross-namespace sharing. The modules
live in `Sts::IsoSts::CommonAttributes::*` and are only included into
`Sts::IsoSts::*` classes. NisoSts would have its own
`Sts::NisoSts::CommonAttributes::*` if it wants the same pattern. This
respects the ADR 2026-05-07.

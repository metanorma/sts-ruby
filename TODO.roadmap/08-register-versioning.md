# C.08: Register versioning for STS schema versions

**Status**: planning. Significant API design.
**Original doc**: `TODO.sts-refactor/04-register-versioning.md` (HIGH
priority, untouched).
**Estimated effort**: large (multi-week).

## Problem

sts-ruby today ships a single `Sts::IsoSts` and `Sts::NisoSts` namespace.
Each maps to one schema version (ISOSTS v1.1, NISO STS 1.0). Real-world
documents use multiple versions:

- ISOSTS v1.1 (2013, frozen)
- NISO STS 1.0 (2017)
- NISO STS 1.2 (2022, evolving)

When a 1.2-specific element (`<processing-meta>`, `<code>`, `<legend>`) is
modelled, it lives in `Sts::NisoSts::*` alongside 1.0 elements. There's no
way to parse a document as "NISO STS 1.0 only" and reject 1.2 elements.

## Goal

Use lutaml-model's `Register` system to version the model classes. The
mml gem already does this:

```ruby
module Mml
  module V2
    class Math < CommonElements
      def self.lutaml_default_register
        :mml_v2
      end
    end
  end
end
```

Each MathML version is a separate module with its own context. sts-ruby
should follow the same pattern: `Sts::IsoSts::V1_1::*`, `Sts::NisoSts::V1_0::*`,
`Sts::NisoSts::V1_2::*`.

## Plan (high level)

1. **API design** — decide caller-facing entrypoint:
   - Option A: `Sts.parse(xml, version: :nisosts_1_0)` — explicit
   - Option B: auto-detect from DOCTYPE / `dtd-version` attribute
   - Option C: keep `Sts::NisoSts::*` as the latest alias, add
     `Sts::NisoSts::V1_0::*` etc. for version-specific access
2. **Re-namespace** — move every existing `Sts::NisoSts::*` class to
   `Sts::NisoSts::V1_2::*` (or wherever it belongs based on schema
   history). Keep backward-compat aliases.
3. **Cross-version testing** — same fixture parsed under different
   versions should accept/reject the right elements.
4. **Version-specific elements** — `<processing-meta>` (1.2-only) lives
   only in V1_2; parsing it under V1_0 raises (or warns).

## Risks

- **Breaking API change** — current callers use `Sts::NisoSts::Standard`
  without a version. Any re-namespace breaks them.
- **Cross-version references** — if V1_2::Standard contains V1_0::Paragraph
  (because Paragraph hasn't changed), the type references cross versions.
  Needs careful design.
- **Migration burden** — large existing model surface.

## Decision needed

This is the largest remaining architectural work. Before starting:

1. Confirm the use case (do downstream consumers actually need version
   discrimination?)
2. Decide the API (Options A/B/C above)
3. Plan migration path for existing callers

## Files affected

- Every `lib/sts/niso_sts/*.rb` (~200 classes)
- Every `lib/sts/iso_sts/*.rb` (~150 classes)
- All specs that reference classes by current names

## How to apply

- Don't start until the design is approved
- Read mml gem's `lib/mml/versioned_parser.rb` and
  `lib/mml/context_configuration.rb` for the established pattern
- Consider a small proof-of-concept (version one element family — e.g.,
  `<list>` — across versions) before committing

## Verification

- Each version's classes round-trip its corresponding schema's fixtures
- Cross-version parsing is explicitly tested
- Existing callers can opt in incrementally (backward compat for at least
  one release)

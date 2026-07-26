# C.07: TbxIsoTml misclassification audit

**Status**: deferred. Same pattern as the prior Fn/FnGroup (PR #47) and
Math (commit 9e977a5) removals — proven approach.
**Memory**: `architecture-namespace-independence` (TbxIsoTml is a shared
namespace, but only for elements that are *actually* TBX-ISO-TML).

## Problem

`Sts::TbxIsoTml::*` is the namespace for elements defined by ISO 30042
(TBX-ISO-TML). The standard defines terminology structures: `<termEntry>`,
`<tig>`, `<term>`, `<descrip>`, `<descripGrp>`, `<note>`, `<definition>`,
`<source>`, `<langSet>`, `<subjectField>`, `<partOfSpeech>`,
`<entailedTerm>`, etc.

The current `lib/sts/tbx_iso_tml/` also contains elements that are **not**
defined by TBX-ISO-TML — they're JATS / NISO STS elements borrowed into TBX
contexts. These are misclassifications: they should live in the host
namespace (NisoSts or IsoSts), not TbxIsoTml.

## Suspects (likely misclassifications)

Each was identified by cross-referencing the TBX-ISO-TML (ISO 30042)
element list. Anything NOT in TBX-ISO-TML is a misfit.

| Class | Actual element source | Should move to |
|---|---|---|
| `TbxIsoTml::Xref` | JATS `<xref>` | (already shared via TbxIsoTml per Bold/Italic precedent — but the precedent itself may be wrong) |
| `TbxIsoTml::TableWrap` | JATS `<table-wrap>` | (same) |
| `TbxIsoTml::Table`, `Thead`, `Tbody`, `Tfoot`, `Tr`, `Th`, `Td`, `Col`, `Colgroup` | XHTML table model | IsoSts already has equivalents; NisoSts has equivalents |
| `TbxIsoTml::Caption` | JATS `<caption>` | (same) |
| `TbxIsoTml::TableWrapFoot` | JATS `<table-wrap-foot>` | (same) |
| `TbxIsoTml::TableBreak` | JATS extension | (same) |
| `TbxIsoTml::ExternalGraphic` | JATS `<external-graphic>` | (same) |
| `TbxIsoTml::ExternalSource` | JATS extension | (same) |
| `TbxIsoTml::Example` | JATS `<example>` (or NISO STS `<non-normative-example>`) | IsoSts has `NonNormativeExample` |
| `TbxIsoTml::Fn` ❌ | already removed (PR #47) | — |
| `TbxIsoTml::FnGroup` ❌ | already removed (PR #47) | — |
| `TbxIsoTml::Math`, `Mrow`, `Mi`, etc. ❌ | already removed (9e977a5) | — |
| `TbxIsoTml::Sup`, `TbxIsoTml::Bold`, `TbxIsoTml::Italic` | JATS emphasis group | IsoSts and NisoSts each have equivalents |

## Per-element decision matrix

For each suspect:

1. Confirm the element is NOT in TBX-ISO-TML (ISO 30042 spec lookup).
2. Identify all call sites (`grep -rn "TbxIsoTml::<Class>" lib/`).
3. Decide:
   - **Delete and repoint** — if the host-equivalent class already exists
     and has compatible API (like Fn → IsoSts::Fn + NisoSts::Fn).
   - **Promote** — if no host-equivalent exists, create one in each host
     namespace (parallel class per the ADR 2026-05-07).
   - **Keep** — if the element genuinely belongs in shared TBX (rare; only
     for true TBX-ISO-TML elements like `TermEntry`, `Term`, `Tig`).

## Why this matters

Each misclassified class is a potential version-mismatch footgun (same
trap as the deleted `TbxIsoTml::Fn`). They also blur the architectural
boundary between TBX (shared, frozen) and STS host namespaces
(independent, evolving).

## How to apply

- Same pattern as PR #47 (delete TbxIsoTml::Fn/FnGroup)
- One PR per element family (e.g., one PR for the XHTML table model, one
  for emphasis, etc.) — keeps review tractable
- Each PR must update all call sites and add specs asserting the
  TbxIsoTml class stays deleted (mirror of `spec/fn_namespace_spec.rb`)

## Verification

- After each PR: `grep -rn "TbxIsoTml::<Class>" lib/` returns nothing
- TBX fixture round-trips still pass
- `bundle exec rake` green

## Open question

The shared-namespace role of TbxIsoTml (for elements used in both IsoSts
and NisoSts hosts without their own version of the element) needs explicit
documentation. Today the boundary is implicit. Consider an ADR documenting
which elements are TBX-ISO-TML (shared) vs which are host-specific.

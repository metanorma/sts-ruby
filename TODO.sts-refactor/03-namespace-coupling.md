# 03: Namespace Coupling Architecture Fix

**Priority**: HIGH
**Category**: Architecture
**Estimated Effort**: High
**Status**: Partially done — 63 → 20 references (GitHub issue #40)

## Problem

`lib/sts/iso_sts/` references `Sts::NisoSts::*` types directly. IsoSts must be
independent of NisoSts (ADR 2026-05-07): ISOSTS is frozen legacy, NISO STS
evolves, so coupling them violates OCP.

PR #31 reduced this from 157 to 63 references. Issue #40 reduced it further,
from 63 to 20.

## Content models from ISOSTS.xsd; `@id` from the 86948b9 convention

IsoSts models carry `@id` following the compatibility convention established in
86948b9 (NISO-XSD-verified). ISOSTS.xsd governs element content
models and all non-`@id` attributes; it is not an authority that forbids the
conventional `@id`. So the two schemas can legitimately differ per element:

| Element | ISOSTS content/attrs | NisoSts model |
|---|---|---|
| `doc-type` (:6378) | `type="xs:string"` | `@id` + content |
| `ics` (:6373) | `type="xs:string"` | `@id` + `ics-desc` child |
| `fpage` | `content-type`, `seq`, `specific-use`, `xml:lang`; no children | `@id` + bold/italic |
| `license` (:51) | `license-type`, `specific-use`, `xml:lang` | `@id`, `xlink:href` |

`feature_doc.xml` declares `<!DOCTYPE standard SYSTEM ".../ISOSTS.dtd">`, and
the ISOSTS DTD agrees with ISOSTS.xsd (both derive `bold`, `sub` etc. from the
JATS 0.4 modules) on content models.

**Round-tripping does not prove correctness.** A model that invents or drops an
attribute still parses and serialises symmetrically, so the suite stays green
while the model is wrong. Assert the exact attribute set per element instead.

Non-`@id` attribute lists must be **generated** from the XSD, never hand-read:
`version` on `tex-math` and `specific-use` on `pub-id` sit after long
`xs:enumeration` blocks and are invisible to a truncated read.

## Done in issue #40 — 43 refs removed, 27 classes added

- **14 `xs:string` elements** (`originator`, `doc-type`, `doc-number`,
  `part-number`, `version`, `suppl-type`, `suppl-number`, `suppl-version`,
  `urn`, `sdo`, `proj-id`, `release-version`, `ics`, `secretariat`) — modelled
  as content IsoSts classes that also carry the conventional `@id` (86948b9);
  `secretariat` is content plus `@id`, not content-only. 23 refs.
- **3 `permissions` refs** repointed to the existing `IsoSts::Permissions`.
- **`ruby` deleted** from `StyledContent` — ISOSTS's `styled-content` content
  model omits `<ruby>` (NISO permits it transitively via the emphasis group).
  Behaviour change: `<ruby>` in `<styled-content>` no longer round-trips.
- **13 element classes** modelled from ISOSTS.xsd: `Year`, `PubDate`,
  `ReleaseVersionId`, `IsProof`, `AltText`, `LongDesc`, `TexMath`, `PubId`,
  `Volume`, `Issue`, `Fpage`, `Lpage`, `PageRange`. 16 refs.
- **`WiNumber` added** — ISOSTS gives `wi-number` an `@id`; it was typed as a
  plain string, silently discarding that `@id`.

### Why classes and not plain `:string`

`xs:string` elements look like they need no class. They do: an empty element
(`<sdo/>`, which `feature_doc.xml` contains) does not survive a `:string`
round-trip. For a scalar, `render_empty: :empty` recovers it; for a collection
(`secretariat`, `ics` — both `maxOccurs="unbounded"`) an empty element parses
to `[]`, destroying the information at parse time before any render option
applies. Content-only classes round-trip every case.

## Remaining — 20 refs

**11 refs to 9 deep roots**: `MetadataStd`, `ElementCitation`, `PersonGroup`,
`Collab`, `Source`, `DispQuote`, `EditingInstruction`, `TermDisplay`,
`BoxedText`. Each reaches the same ~152-class mutually-recursive core
(`Section` → `Paragraph` → `DispQuote` → `Paragraph`). `DispQuote` has 3 direct
children but pulls all 152. No incremental path — needs its own decision.

**9 refs whose ISOSTS content models have real children**, closure not measured:
`attrib` (:1082), `term-head` (:4308), `article-title`, `license` → `license-p`
(:51), `publisher` → `publisher-loc`, `custom-meta-group` → `custom-meta`.
`attrib` and `term-head` are **not** trivial leaves in ISOSTS despite what the
NisoSts models suggest; `license-p` reaches `array`/`alternatives`, so these may
not be cheap. Measure before planning.

## Rejected: three-tier `Sts::Base` hierarchy

An earlier draft of this document proposed shared base types in `Sts::Base` that
both namespaces inherit. This contradicts the 2026-05-07 ADR, and the schemas
genuinely diverge — `IsoSts::Fig` has `title`/`alternatives` that
`NisoSts::Figure` lacks; `IsoSts::Ref` has `nlm-citation`/`citation-alternatives`
that `NisoSts::Reference` lacks. A shared base would fight the schemas.

That draft also targeted `lib/sts/iso_sts/content_groups/highlight_elements.rb`
and "194+ references" to emphasis types. That file was deleted as dead code; the
real work was metadata types, not highlight elements.

## Naming trap (for the deferred work)

A mechanical `s/NisoSts::/IsoSts::/` is wrong. Nine elements already have
different class names per namespace, so a blind rename creates `IsoSts::Section`
alongside the existing `IsoSts::Sec` — two classes for one `sec` element:

`Section`/`Sec`, `Figure`/`Fig`, `Reference`/`Ref`, `ReferenceList`/`RefList`,
`SectionArray`/`Array`, `StdCrossReference`/`StandardCrossReference`,
`DisplayFormula`/`DispFormula`, `TermSection`/`TermSec`,
`ReferenceStandard`/`Std`.

Remap child references by **XML element name**, not class name.

## Scope boundary

Independence from NisoSts is not independence in general: `lib/sts/iso_sts/`
still references 6 `TbxIsoTml` types directly, and much of the deferred closure
reaches `TbxIsoTml`/MathML. Those are shared namespaces, outside this ADR.

## Verification

1. `grep -rho "Sts::NisoSts::" lib/sts/iso_sts/ | wc -l` → `20`
2. Every *non-`@id`* attribute on an IsoSts model traces to a line in
   `ISOSTS.xsd`; `@id` follows the 86948b9 convention
3. Autoload registry 1:1 with the directory (112/112)
4. `bundle exec rspec` green; `bundle exec rubocop` clean

# 03: Namespace Coupling Architecture Fix

**Priority**: HIGH
**Category**: Architecture
**Estimated Effort**: High
**Status**: Partially done — 63 → 16 references (GitHub issue #40)

## Problem

`lib/sts/iso_sts/` references `Sts::NisoSts::*` types directly. IsoSts must be
independent of NisoSts (ADR 2026-05-07): ISOSTS is frozen legacy, NISO STS
evolves, so coupling them violates OCP.

PR #31 reduced this from 157 to 63 references. Issue #40 reduced it further,
from 63 to 16.

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

## Done in issue #40 — 47 refs removed, 46 classes added

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
- **`Publisher` closure added** — `Publisher`, `PublisherName`, `PublisherLoc`,
  and `Email` are modelled from ISOSTS.xsd; `PublisherLoc` reuses the existing
  IsoSts `ExtLink` and `Uri` boundary models. All four retain the
  project-mandated `@id` model surface. 1 ref.
- **15 reusable dependency leaves added** — `Abbrev`, `Annotation`, `Country`,
  `Day`, `Etal`, `Fax`, `InlineGraphic`, `Institution`, `MilestoneEnd`,
  `MilestoneStart`, `Month`, `Num`, `ObjectId`, `Phone`, and `Season` are
  modelled from ISOSTS.xsd and close entirely on existing IsoSts types. They
  remove no direct reference yet, but establish the first shared dependency
  layer for the remaining recursive roots.
- **3 Niso-only child refs deleted** — `std-meta` from `Front` and
  `editing-instruction` from `Body` and `Sec`. Neither element exists in
  ISOSTS.xsd, so adding IsoSts equivalents would incorrectly expand the schema.

### Why classes and not plain `:string`

`xs:string` elements look like they need no class. They do: an empty element
(`<sdo/>`, which `feature_doc.xml` contains) does not survive a `:string`
round-trip. For a scalar, `render_empty: :empty` recovers it; for a collection
(`secretariat`, `ics` — both `maxOccurs="unbounded"`) an empty element parses
to `[]`, destroying the information at parse time before any render option
applies. Content-only classes round-trip every case.

## Remaining — 16 refs

**8 refs to 7 recursive roots**: `ElementCitation`, `PersonGroup`, `Collab`,
`Source`, `DispQuote`, `TermDisplay`, and `BoxedText`. Each reaches the same
78–79-element mutually-recursive core before existing IsoSts boundaries
(`sec` → `p` → `disp-quote` → `p`). No direct one-file path remains.

**8 refs to 5 child-bearing roots**, now measured after the first dependency
layer: `attrib` (:1082) reaches 78 not-yet-modelled ISOSTS elements before
existing IsoSts boundaries, `term-head` (:4308) reaches 79, `article-title`
reaches 78, `license` → `license-p` (:51) reaches 84, and
`custom-meta-group` → `custom-meta` reaches 82. They converge on the same
recursive content core as the deep roots, so none is another bounded model
batch. `publisher` was the only exception: its four-element closure
(`publisher`, `publisher-name`, `publisher-loc`, `email`) is complete.
The Niso `Attrib` class is only 17 lines because it omits all 37 ISOSTS child
types; copying it would silently drop valid ISO content rather than decouple it.

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

1. `grep -rho "Sts::NisoSts::" lib/sts/iso_sts/ | wc -l` → `16`
2. Every *non-`@id`* attribute on an IsoSts model traces to a line in
   `ISOSTS.xsd`; `@id` follows the 86948b9 convention
3. Autoload registry 1:1 with the directory (131/131)
4. `bundle exec rspec` green; `bundle exec rubocop` clean

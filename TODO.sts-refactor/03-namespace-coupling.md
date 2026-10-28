# 03: Namespace Coupling Architecture Fix

**Priority**: HIGH
**Category**: Architecture
**Estimated Effort**: High
**Status**: Complete — 63 → 0 references (GitHub issue #40)

## Problem

`lib/sts/iso_sts/` references `Sts::NisoSts::*` types directly. IsoSts must be
independent of NisoSts (ADR 2026-05-07): ISOSTS is frozen legacy, NISO STS
evolves, so coupling them violates OCP.

PR #31 reduced this from 157 to 63 references. Issue #40 reduced it further,
from 63 to 16. The `IsoSts::DispQuote` / `IsoSts::BoxedText` addition then
reduced it from 16 to 13 (Body#disp_quote, Sec#disp_quote, Sec#boxed_text).
The `IsoSts::Attrib` addition then reduced it from 13 to 11
(Array#attrib, TableWrapFoot#attrib) and filled the omission in DispQuote /
BoxedText from PR #48. The License/TermHead/CustomMetaGroup closure then
reduced it from 11 to 6 (Permissions#license, DefList#term_head, and
IsoMeta/RegMeta/NatMeta#custom_meta_group). The full recursive closure then
removed the final 6 references.

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

## Done in issue #40 — 63 refs removed, 136 classes added

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
- **`DispQuote` and `BoxedText` added** — modelled from ISOSTS.xsd (not copied
  from NisoSts, which disagrees: `NisoSts::DispQuote` lacks `xml_lang` and
  `title`; `NisoSts::BoxedText` carries `form_type`/`is_form` that ISOSTS does
  not define). Their first pass was limited to existing IsoSts child types.
  `BoxedText#sts_object_id` (not `:object_id`) follows the `NisoSts::Graphic`
  convention to avoid clashing with `Object#object_id`. 3 refs.
- **`Attrib` added** — mixed-content class modelled from ISOSTS.xsd with the
  25 inline-element children that had IsoSts types at the time. It fills the
  `attrib` gap left in `DispQuote` and `BoxedText` from the prior bullet.
  2 refs (`Array#attrib`, `TableWrapFoot#attrib`).
- **License / TermHead / CustomMetaGroup closure added** — `License`,
  `LicenseP`, `TermHead`, `CustomMetaGroup`, `CustomMeta`, `MetaName`, and
  `MetaValue` modelled from ISOSTS.xsd. 5 refs (`Permissions#license`,
  `DefList#term_head`, `IsoMeta/RegMeta/NatMeta#custom_meta_group`).
- **90-model full closure completed** — 80 models are new and 10 earlier
  bounded models are expanded to their complete content models. All direct
  and transitive ISOSTS elements needed by `disp-quote`, `boxed-text`,
  `person-group`, `collab`, `source`, `article-title`, and the bounded
  metadata roots now close through IsoSts, TBX, and MathML types. Every model
  uses the exact ISOSTS attributes and child cardinalities plus the mandatory
  project `@id` surface; none uses `required: true`. This removes the final
  6 refs from `MixedCitation`, `Ref`, and `TermSec`.

### Why classes and not plain `:string`

`xs:string` elements look like they need no class. They do: an empty element
(`<sdo/>`, which `feature_doc.xml` contains) does not survive a `:string`
round-trip. For a scalar, `render_empty: :empty` recovers it; for a collection
(`secretariat`, `ics` — both `maxOccurs="unbounded"`) an empty element parses
to `[]`, destroying the information at parse time before any render option
applies. Content-only classes round-trip every case.

## Complete — 0 refs

The final 6 references were `Ref#element_citation`, four `MixedCitation`
children (`person_group`, `collab`, `source`, and `article_title`), and
`TermSec#term_display`. Their complete recursive and bounded closures are now
modelled in IsoSts.

The earlier four bounded roots had a combined 12-element closure before
existing IsoSts boundaries:

- `TermHead` — 1 ref in `DefList`; only `term-head` was needed.
- `CustomMetaGroup` — 3 refs in `IsoMeta`, `NatMeta`, and `RegMeta`; its
  4-element closure is `custom-meta-group`, `custom-meta`, `meta-name`, and
  `meta-value`.
- `License` — 1 ref in `Permissions`; its 6-element closure is `license`,
  `license-p`, `award-id`, `funding-source`, `open-access`, and `price`.
- `TermDisplay` — 1 ref in `TermSec`; only `term-display` was needed.

All four closures are now modelled in IsoSts and all six host references point
to their IsoSts types.

## Rejected: three-tier `Sts::Base` hierarchy

An earlier draft of this document proposed shared base types in `Sts::Base` that
both namespaces inherit. This contradicts the 2026-05-07 ADR, and the schemas
genuinely diverge — `IsoSts::Fig` has `title`/`alternatives` that
`NisoSts::Figure` lacks; `IsoSts::Ref` has `nlm-citation`/`citation-alternatives`
that `NisoSts::Reference` lacks. A shared base would fight the schemas.

That draft also targeted `lib/sts/iso_sts/content_groups/highlight_elements.rb`
and "194+ references" to emphasis types. That file was deleted as dead code; the
real work was metadata types, not highlight elements.

## Naming trap

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
still references 6 `TbxIsoTml` types directly, and the completed closure reaches
`TbxIsoTml`/MathML. Those are shared namespaces, outside this ADR.

## Verification

1. `grep -rho "Sts::NisoSts::" lib/sts/iso_sts/ | wc -l` → `0`
2. Every *non-`@id`* attribute on an IsoSts model traces to a line in
   `ISOSTS.xsd`; `@id` follows the 86948b9 convention
3. Autoload registry 1:1 with the directory (220/220)
4. `bundle exec rspec` green; `bundle exec rubocop` clean

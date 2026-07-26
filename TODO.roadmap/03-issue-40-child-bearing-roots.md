# B.03: Issue #40 — model child-bearing IsoSts roots

**Status**: in flight (License, TermHead, CustomMetaGroup all completable in one PR).
**Blocks**: nothing.
**Closes**: 5 of 11 IsoSts→NisoSts refs (issue #40).

## Remaining child-bearing refs

| Class | Referenced from | ISOSTS schema complexity |
|---|---|---|
| `IsoSts::License` | `IsoSts::Permissions#license` | simple (3 attrs + `<license-p>` children) |
| `IsoSts::TermHead` | `IsoSts::DefList#term_head` | simple (mixed content) |
| `IsoSts::CustomMetaGroup` | `IsoSts::{IsoMeta,RegMeta,NatMeta}#custom_meta_group` (×3) | simple (`<custom-meta>` children) |

## Plan

1. **IsoSts::License** — model from ISOSTS.xsd (`<license>` element):
   - 8 attrs: license_type, specific_use, xml_lang, xlink_* (6)
   - children: `license_p` (unbounded) — needs `IsoSts::LicenseP` too
   - `license_p` itself is mixed-content with the full block-element set;
     for first pass, model `license_p` with content + common inline children
     (similar to IsoSts::Attrib)
2. **IsoSts::LicenseP** — needed as License child
3. **IsoSts::TermHead** — model from ISOSTS.xsd (`<term-head>`):
   - mixed content
   - inline-element children (similar to IsoSts::Attrib pattern)
4. **IsoSts::CustomMetaGroup** — model from ISOSTS.xsd:
   - No attributes
   - Single child type: `<custom-meta>` (unbounded)
5. **IsoSts::CustomMeta** — needed as CustomMetaGroup child
   - 9 attrs: id, specific_use, xml_lang, xlink_*
   - children: `<meta-name>`, `<meta-value>`
6. **IsoSts::MetaName** — `xs:string` element
7. **IsoSts::MetaValue** — mixed content

## Specs (per established pattern)

- Attribute-set assertions for each new class
- Child-class type assertions
- Round-trip test for at least one realistic XML fragment
- No-NisoSts guard on each new file
- Repoint type assertions (e.g., `IsoSts::Permissions#license is IsoSts::License`)

## Verification

- `grep -rn "NisoSts::" lib/sts/iso_sts/` count drops from 11 → 6
- Full test suite green
- Rubocop clean (anti-patterns spec enforces all rules)

## How to apply

- One PR (e.g., `feat/isosts-license-termhead-custommetagroup`) covering all
  7 new classes + the 5 repoints.
- Same pattern as PR #48 (DispQuote/BoxedText) and PR #50 (Attrib): model
  from ISOSTS.xsd, omit not-yet-modelled IsoSts children, track omissions
  in the spec comment.
- Update `TODO.sts-refactor/03-namespace-coupling.md` count.

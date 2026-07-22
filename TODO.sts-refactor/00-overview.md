# STS-Ruby Refactoring TODO Overview

**Date**: 2026-05-06
**Priority Order**: Execute in numeric order, dependencies noted
**Total Files**: 11

## Architecture Principles
- **MECE**: Mutually Exclusive, Collectively Exhaustive task organization
- **Model-Driven**: All elements defined via lutaml-model, no runtime string-lookup
- **Open/Closed**: Schema modules open for extension, closed for modification
- **DRY**: Content groups eliminate duplication; no copy-paste inheritance
- **No Anti-Patterns**: Never `send`, `respond_to`, `Object.const_get`, `method_missing`

---

## File Inventory

| # | File | Category | Priority | Dependencies |
|---|------|----------|----------|--------------|
| 01 | `01-mathml-delegation.md` | Anti-Pattern Fix | DONE | — |
| 02 | `02-type-resolution.md` | Anti-Pattern Fix | DONE | — |
| 03 | `03-namespace-coupling.md` | Architecture | IN PROGRESS (63→20 refs) | 01, 02 |
| 04 | `04-register-versioning.md` | Architecture | HIGH | 01, 02 |
| 05 | `05-missing-elements.md` | Feature Gap | MOSTLY DONE | 04 |
| 06 | `06-missing-attributes.md` | Feature Gap | DONE | 04 |
| 07 | `07-incomplete-models.md` | Feature Gap | MOSTLY DONE | 04 |
| 08 | `08-isoiec-profile.md` | Architecture | DONE | 04 |
| 09 | `09-autoload-cleanup.md` | Cleanup | DONE | 01, 03 |
| 10 | `10-test-coverage.md` | Quality | ONGOING | All |
| 11 | `11-duplicate-models.md` | Architecture | MEDIUM | 03, 04 |

---

## Quick Reference: Critical Gaps from Audit

### From GAPS.guidelines.iso-sts-ed2.1/
- ~~`<processing-meta>` (Ed 2.1 new element) — NOT modeled~~ → DONE
- ~~`<code>`, `<inline-code>` — NOT modeled~~ → DONE
- ~~`<legend>` — NOT modeled~~ → DONE
- ~~7+ elements missing `@id` attribute~~ → DONE: all 7 have `@id`
- ~~`Permissions` incomplete~~ → DONE
- ~~`Graphic` missing `@id`~~ → DONE

### From GAPS.guidelines.niso-sts-v1.0/
- ~~`<index>` hierarchy entirely missing~~ → DONE (Index, IndexDiv, IndexEntry, IndexTitleGroup, SeeEntry, SeeAlsoEntry)
- ~~`<toc>` hierarchy entirely missing~~ → DONE (Toc, TocDiv, TocEntry, TocTitleGroup)
- ~~`TermDisplay` incomplete~~ → DONE
- ~~`@xml:lang` on multilingual elements~~ → DONE (Label, Caption, DefItem, DefList, etc.)
- ~~`BoxedText` incomplete~~ → DONE (full children, form-type, originator)
- ~~`Front` missing std-doc-meta, toc~~ → DONE
- ~~`Back` missing index, toc, glossary~~ → DONE
- ~~`@originator` missing on 7+ elements~~ → DONE (Paragraph, Section, Abstract, App, DispQuote, List, NormativeNote, NonNormativeNote)

### From GAPS.guidelines.schema-xref.md
- ~~`<sec-meta>` — NOT modeled (lower priority)~~ → DONE
- OASIS CALS table model unsupported (legacy, lower priority)
- ~~NISO STS 1.2 additions partially done~~ → DONE (vocab, style-detail, use-type attrs on IcsWrap, KwdGroup, NamedContent, Role, SubjGroup)

---

## Completed (2026-05-06)

### 01-mathml-delegation.md ✅
- Replaced `lib/sts/mathml.rb` (had `method_missing`, `respond_to_missing?`, `.send`)
- New version is a thin type alias: `Sts::Mathml::Math = Mml::V3::Math`
- All actual MathML elements used directly from `Mml::V3::*`

### 02-type-resolution.md ✅
- Replaced `Object.const_get` in `lib/sts/content_groups/helpers.rb`
- `inject_elements` now takes actual class objects (compile-time safe)
- Updated docstrings with tuple format documentation

### Dead Code Removed
- `lib/sts/iso_sts/content_groups/` — entire directory (highlight_elements.rb
  was only file that used helpers, but IsoSts models all define attributes
  explicitly, so content groups were never called)
- `lib/sts/niso_sts/content_groups/` — entire directory (9 files, all dead
  code — would crash with `NoMethodError` if ever loaded since they call
  `inject_elements` which was never defined in NisoSts::ContentGroups)

### Anti-Pattern Audit Result
```
grep -r "method_missing|respond_to_missing|Object.const_get|\.send" lib/
# Zero matches
```

### Moxml Monkey-Patch Removed
- Removed the no-op monkey-patch on `Moxml::Adapter::Nokogiri.children`
- The patch was replacing `children` with an identical implementation
- Likely originally worked around a Moxml bug that was since fixed upstream

### @id Attributes Added (Partial TODO 06)
- `NisoSts::DefItem` — now has `@id`
- `NisoSts::Graphic` — now has `@id`
- `NisoSts::ListItem` — now has `@id`
- `NisoSts::ReferenceStandard` — now has `@id`
- `TbxIsoTml::Xref` — now has `@id`
- `TbxIsoTml::TableWrapFoot` — now has `@id`

### frozen_string_literal: true
- All 456 `.rb` files in `lib/` now have `# frozen_string_literal: true`

### Anti-Pattern Regression Test
- `spec/anti_patterns_spec.rb` — 1768 examples checking every lib file for:
  `method_missing`, `respond_to_missing?`, `Object.const_get`, `.send()`

### Test Results
```
2058 examples, 0 failures, 1 pending
480 files inspected, no offenses detected
0 anti-patterns found in 459 lib files
```

### @id Attributes Added to All Models (2026-05-07)
- 161 NisoSts models now have `@id` (XSD-verified)
- 32 TbxIsoTml models now have `@id`
- 29 IsoSts models now have `@id`
- Total: 222 models updated

### Table Cell Content Expansion (2026-05-07)
- `TbxIsoTml::Td` expanded from 18 children to 40+ children matching XSD inside-cell content model
- `TbxIsoTml::Th` expanded from 17 children to 40+ children matching XSD inside-cell content model
- Added: disp-formula, disp-formula-group, element-citation, mixed-citation, emphasis elements (overline, roman, sc, strike), fig, fig-group, inline-graphic, private-char, normative-note, normative-example, non-normative-example, email, ext-link, named-content, alternatives, code, media, preformat, target, array
- Note: disp-quote, speech, statement are NOT in XSD inside-cell group — NOT needed

### ISO/IEC Profile Validator (2026-05-07)
- `Sts::Profiles::IsoIec::Validator` with structural, metadata, originator, and doc-type validation
- `Sts::Profiles::IsoIec::Constraints` with frozen string constants
- 11 specs covering: valid doc, missing front/body, missing std-ident children, unrecognized originator/doc-type
- Zero anti-patterns: direct method calls only, no send/respond_to/const_get

### NameAlternatives Expansion (2026-05-07)
- Added `string-name` child to `NameAlternatives` per XSD name-alternatives.class

### Test Results (2026-05-07)
```
2085 examples, 0 failures, 1 pending
485 files inspected, no offenses detected
0 anti-patterns found in lib/
```

### IsoSts Namespace Independence (2026-05-07)
- ARCHITECTURE DECISION: IsoSts must be independent **of NisoSts**. This is not
  independence in general — `lib/sts/iso_sts/` still references `TbxIsoTml` and
  MathML types directly, and those shared namespaces are outside this ADR.
- ISOSTS is frozen legacy; NISO STS evolves — combining them violates OCP
- Created 11 new IsoSts-specific types: Monospace, Sc, Strike, Underline, Uri,
  NamedContent, StandardRef, MetaDate, ContentLanguage (with autoloads)
- Decoupled Bold, Italic, ExtLink to use IsoSts types instead of NisoSts
- Reduced IsoSts→NisoSts cross-references from 157 to 63 (60% reduction)
- 48 types still need IsoSts equivalents for complete independence
- Test coverage: 99.8% line coverage, 2121 examples passing

### Code Cleanup (2026-05-07)
- Removed redundant `require "lutaml/model"` from 13 files (already loaded by lib/sts.rb)
- Added SimpleCov coverage tracking with 80% minimum threshold
- Cleaned extra blank lines from require removal

---

## Remaining Work (2026-05-07)

### Small Items
- OASIS CALS table model (legacy, lower priority)
- ~~Expand table cell content (disp-quote, speech, statement in td — NISO STS 1.2)~~ → NOT in XSD inside-cell group; Td/Th expanded to full XSD inside-cell content model
- ~~Expand StringName usage (in contrib, element-citation, related-article — NISO STS 1.2)~~ → DONE: added to name-alternatives; already in person-group and mixed-citation

### Architectural Items (High Effort)
- `03-namespace-coupling.md` — IN PROGRESS: 63→20 IsoSts→NisoSts references
  remaining (issue #40). ISOSTS.xsd governs content models and all non-`@id`
  attributes; the `@id` follows the 86948b9 convention.
- `04-register-versioning.md` — Version the models via lutaml-model Registers
- `11-duplicate-models.md` — 44 overlapping element resolution (depends on 03)

### Schema conformance — dropped ISOSTS attributes
The 2026-05-07 "@id added to all models (XSD-verified)" pass verified against
the **NISO** XSD and applied the result to IsoSts.
- **Fixed — dropped ISOSTS attributes restored.** 15 IsoSts models were
  silently dropping ISOSTS attributes present in real documents (data loss):
  `sub`/`sup` (`arrange`+`specific-use`), `ext-link`/`mixed-citation`/`uri`/
  `named-content` (`xlink:*`), `graphic` (`xlink:*`+`originator`), `copyright-*`,
  `edition`, `title`, `label`, `underline`, `body`. This change adds them and
  fixes `sec`/`standard`/`term-sec`, which mapped `xml:lang` under the wrong XML
  name. (`meta-date` was NOT lossy — it already maps `type`.)
- **Not a bug — the conventional `@id`.** IsoSts models carry an `@id` that
  ISOSTS does not itself define; this is the deliberate 86948b9 convention
  (NISO-XSD-verified), not dead surface.
- **Remaining follow-up (separate change).** 7 spurious attributes on 5 models
  (model carries an attr ISOSTS does not define: `graphic` `type`, `body`/`back`
  `content-type`, `content-language`/`language` extras), and the 6 classes left
  without `@id` in 86948b9 (`monospace`, `sc`, `strike`, `underline`, `uri`,
  `standard_ref`).

## Next Action
Two independent tracks:
1. Finish `03` — the 20 remaining refs split into 11 deep-root refs (each
   reaching a ~152-class recursive core) and 9 child-bearing refs whose closure
   is unmeasured. Both need sizing before planning.
2. File and fix the 16 lossy models above — real data loss, unrelated to
   decoupling.

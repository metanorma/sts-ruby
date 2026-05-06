# Section 10: References

## Overview
Section 10 covers document-internal references (cross-references) and references to other documents. It details `<xref>` usage with various `@ref-type` values, footnotes, URLs, and supplementary material.

## Element Coverage

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<xref>` | Cross-references | `TbxIsoTml::Xref` | Partial | Missing `@custom-type` attribute; content handling limited |
| `<fn>` | Footnotes | `NisoSts::Fn` / `TbxIsoTml::Fn` | Supported | Has `@id`, `<label>`, `<p>` |
| `<fn-group>` | Footnote group (legacy IEC) | `NisoSts::FnGroup` | Supported | In `<back>` |
| `<ext-link>` | External URLs | `NisoSts::ExtLink` | Supported | Has `@ext-link-type`, `@xlink:href` |
| `<uri>` | URIs in text | `NisoSts::Uri` | Supported | |
| `<std>` | Standard references in text | `NisoSts::ReferenceStandard` | Partial | Missing `@content-type`, `@std-id` |
| `<mixed-citation>` | Non-standard document references | `NisoSts::MixedCitation` | Partial | Missing `@id`, `<break>`, `<uri>` children |
| `<supplementary-material>` | External supplementary files | `NisoSts::SupplementaryMaterial` | Supported | Has `@xlink:href`, content |
| `<inline-supplementary-material>` | Inline supplementary reference | `NisoSts::InlineSupplementaryMaterial` | Supported | |

## Attribute Gaps

| Attribute | Parent Element | Guidelines Usage | Modeled | Status |
|-----------|---------------|-----------------|---------|--------|
| `@ref-type` | `<xref>` | "sec", "table", "fig", "disp-formula", "bibr", "fn", "table-fn", "app", "list", "abbreviation", "custom" | Yes | Supported |
| `@rid` | `<xref>` | Target element ID | Yes | Supported |
| `@custom-type` | `<xref>` | "term-entry", "note", "example" (with `@ref-type="custom"`) | No | **Missing** -- critical for term cross-refs |
| `@id` | `<xref>` | Element identifier (Sec 3.4) | No | Missing |
| `@ext-link-type` | `<ext-link>` | "uri" for URLs | Yes | Supported |
| `@xlink:href` | `<ext-link>` | Actual URL | Yes | Supported |
| `@id` | `<fn>` | Footnote identifier | Yes | Supported |
| `@id` | `<mixed-citation>` | Element identifier (Sec 3.4) | No | Missing |

## Cross-Reference Type Values (Sec 10.1.1)

| `@ref-type` Value | Usage | Modeled | Notes |
|-------------------|-------|---------|-------|
| "abbreviation" | Cross-ref to abbreviations | Supported (string) | |
| "app" | Cross-ref to annexes | Supported | |
| "bibr" | Cross-ref to bibliography | Supported | |
| "custom" | With `@custom-type` for terms, notes, examples | Partial | `@custom-type` not modeled |
| "disp-formula" | Cross-ref to formulae | Supported | |
| "fig" | Cross-ref to figures | Supported | |
| "fn" | Cross-ref to footnotes | Supported | |
| "sec" | Cross-ref to sections | Supported | |
| "table" | Cross-ref to tables | Supported | |
| "table-fn" | Cross-ref to table footnotes | Supported | |
| "list" | Cross-ref to list items | Supported | |

## Key Gaps
- [ ] **CRITICAL**: `TbxIsoTml::Xref` missing `@custom-type` attribute -- required for cross-references to terms (`@custom-type="term-entry"`), notes (`@custom-type="note"`), and examples (`@custom-type="example"`) from outside the terminology section (Sec 9.2.6, 10.1.3)
- [ ] `TbxIsoTml::Xref` missing `@id` attribute -- listed in Sec 3.4 as needing ID
- [ ] `NisoSts::MixedCitation` missing `@id` attribute -- listed in Sec 3.4 as needing ID
- [ ] `NisoSts::MixedCitation` missing `<break>` child -- legacy content has line breaks within citations (B.2.21)
- [ ] `NisoSts::MixedCitation` missing `<uri>` child -- legacy content has URIs inside citations (B.2.21)
- [ ] `NisoSts::ReferenceStandard` missing `@content-type` attribute -- used for "uri" references
- [ ] `NisoSts::ReferenceStandard` missing `<std-id>` child -- IEC references use `<std-id>` inside `<std>` (Sec B.2.20)

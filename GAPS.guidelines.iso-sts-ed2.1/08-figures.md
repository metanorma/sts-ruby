# Section 8: Figures

## Overview
Section 8 covers figure elements, sub-figures and figure groups, figure keys, and unit statements in figures.

## Element Coverage

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<fig>` | Figure element | `NisoSts::Figure` | Partial | Missing `<legend>`, `<def-list>` (for IEC keys) should be collection, missing `<inline-graphic>`, missing `<supplementary-material>` |
| `<fig-group>` | Sub-figure group | `NisoSts::FigGroup` | Partial | Missing `<legend>`, `<non-normative-note>` children |
| `<label>` | Figure number | `NisoSts::Label` | Supported | |
| `<caption>` | Figure caption | `NisoSts::Caption` | Supported | Contains `<title>`, `<p>` |
| `<graphic>` | Figure graphic | `NisoSts::Graphic` | Partial | Missing `<label>`, `<caption>` children for sub-figure captions (ISO) |
| `<inline-graphic>` | Inline graphic in figure keys | `NisoSts::InlineGraphic` | Supported | |
| `<legend>` | Figure key container (new) | Missing | Missing | **Critical gap** -- introduced in Ed 2.1 for figure keys |
| `<def-list>` | Figure key items | `NisoSts::DefList` | Supported | Mapped in `Figure` but as singular (should be collection for multiple keys) |
| `<def-item>` | Key item pair | `NisoSts::DefItem` | Supported | |
| `<term>` | Key symbol/number | `NisoSts::Term` | Supported | |
| `<def>` | Key description | `NisoSts::Def` | Supported | |
| `<non-normative-note>` | Figure notes | `NisoSts::NonNormativeNote` | Supported | Mapped in `Figure` |
| `<table-wrap>` | ISO figure key table | `TbxIsoTml::TableWrap` | Supported | ISO uses `<table-wrap content-type="fig-index">` for figure keys |
| `<p>` | Unit statements, caption content | `NisoSts::Paragraph` | Partial | Missing `@content-type` for dimension statements |

## Attribute Gaps

| Attribute | Parent Element | Guidelines Usage | Modeled | Status |
|-----------|---------------|-----------------|---------|--------|
| `@id` | `<fig>` | Figure identifier | Yes | Supported |
| `@orientation` | `<fig>` | "landscape" / "portrait" | Yes | Supported |
| `@fig-type` | `<fig>` | Usually "figure" (ISO) | Yes | Supported |
| `@content-type` | `<p>` (in `<caption>`) | "dimension" for unit statements | No | Missing on `Paragraph` |
| `@list-content` | `<def-list>` | "figure" for figure keys | No | Model has `@list-type` not `@list-content` |
| `@id` | `<fig-group>` | Figure group identifier | Yes | Supported |
| `@orientation` | `<fig-group>` | "landscape" / "portrait" | Yes | Supported |

## Key Gaps
- [ ] **CRITICAL**: `<legend>` element not modeled -- the primary container for figure keys in OSD (Sec 8.3). Contains `<title>` ("Key") and `<def-list>`
- [ ] `NisoSts::Figure` missing `<legend>` as a child element
- [ ] `NisoSts::FigGroup` missing `<legend>` as a child element -- "only one `<legend>` for each `<fig-group>`" (Sec 8.2)
- [ ] `NisoSts::FigGroup` missing `<non-normative-note>` and `<non-normative-example>` children -- guidelines say these go in the last `<fig>` but the group should support them
- [ ] `NisoSts::Figure` maps `<def-list>` as singular but guidelines show figure can contain both `<def-list>` (IEC keys) and `<legend>` (new OSD keys)
- [ ] `NisoSts::Graphic` missing `<label>` and `<caption>` children -- ISO sub-figures use `<graphic>` with `<label>` and `<caption>` (Sec B.2.16)
- [ ] `NisoSts::Paragraph` missing `@content-type` attribute -- needed for `<p content-type="dimension">` in figure captions (Sec 8.4)
- [ ] `NisoSts::DefList` has `@list-type` but guidelines use `@list-content="figure"` -- possible attribute name mismatch

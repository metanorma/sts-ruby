# Section 6: Tables and Section 8: Figures

## Overview
Covers XHTML tables (`<table-wrap>`, `<table>`, `<thead>`, `<tbody>`, `<tr>`, `<th>`, `<td>`, `<colgroup>`, `<col>`), formal and informal tables, table notes/footnotes, unit statements, and figure elements (`<fig>`, `<fig-group>`, `<graphic>`), sub-figures, figure keys, and unit statements.

## Table Element Coverage

### Table Container

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<table-wrap>` | Formal table container | `TbxIsoTml::TableWrap` | ✅ Supported | |
| `@id` | Table identifier (e.g. tab_1, tab-1) | ✅ Mapped | OK | |
| `@orientation` | "landscape" for landscape tables | ✅ Mapped | OK | |
| `@position` | "float" or "anchor" | ✅ Mapped | OK | |
| `@content-type` | Table content type | ✅ Mapped | OK | |
| `<label>` | Table label ("Table 1") | ✅ Mapped (as string) | ⚠️ Partial | Modeled as string, should support mixed content with `<sup>` |
| `<caption>` | Table caption | ✅ Via `NisoSts::Caption` | OK | |
| `<table>` | XHTML table | `TbxIsoTml::Table` | ✅ Supported | |
| `<graphic>` | Graphic inside table-wrap | ✅ Mapped | OK | |
| `<table-wrap-foot>` | Table footer/notes | `TbxIsoTml::TableWrapFoot` | ✅ Supported | |

### XHTML Table Elements

| Element | sts-ruby Model | Status | Notes |
|---------|---------------|--------|-------|
| `<table>` | `TbxIsoTml::Table` | ✅ Supported | With `@border`, `@rules`, `@frame`, `@width`, `@style`, `@cellspacing`, `@cellpadding`, `@summary` |
| `<colgroup>` | `TbxIsoTml::Colgroup` | ✅ Supported | |
| `<col>` | `TbxIsoTml::Col` | ✅ Supported | With `@align`, `@valign`, `@width`, `@span` |
| `<thead>` | `TbxIsoTml::Thead` | ✅ Supported | |
| `<tbody>` | `TbxIsoTml::Tbody` | ✅ Supported | |
| `<tfoot>` | `TbxIsoTml::Tfoot` | ✅ Supported | |
| `<tr>` | `TbxIsoTml::Tr` | ✅ Supported | With `@align`, `@valign`, `@style` |
| `<th>` | `TbxIsoTml::Th` | ✅ Supported | With `@align`, `@valign`, `@colspan`, `@rowspan`, `@scope`, `@style` |
| `<td>` | `TbxIsoTml::Td` | ✅ Supported | With `@align`, `@valign`, `@colspan`, `@rowspan`, `@scope`, `@style` |

### Table Footnotes (Section 6.6.3)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<fn>` in `<table-wrap-foot>` | Table footnotes | ✅ Via `TbxIsoTml::Fn` | OK | |
| `<fn-group>` in `<table-wrap-foot>` | Footnote group | ✅ Via `TbxIsoTml::FnGroup` | OK | |
| `<p>` in `<table-wrap-foot>` | Unit statements | ✅ Via `NisoSts::Paragraph` | OK | |
| `<non-normative-note>` in foot | Table notes | ✅ Via `NisoSts::NonNormativeNote` | OK | |

### Informal Tables (Section 6.5)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<array>` | Informal table wrapper | `NisoSts::SectionArray` | ✅ Supported | Maps `<table>` inside |
| `<table>` in `<array>` | Table without caption | ✅ Via `TbxIsoTml::Table` | OK | |

## Figure Element Coverage

### Figure Container

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<fig>` | Figure container | `NisoSts::Figure`, `IsoSts::Fig` | ✅ Supported | |
| `@id` | Figure ID (fig_1 / fig-1) | ✅ Mapped | OK | |
| `@fig-type` | Figure type (usually "figure") | ✅ Mapped on NisoSts::Figure | OK | |
| `@orientation` | Portrait/landscape | ✅ Mapped | OK | |
| `<label>` | Figure label | ✅ Via `NisoSts::Label` | OK | |
| `<caption>` | Figure caption | ✅ Via `NisoSts::Caption` | OK | |
| `<graphic>` | Figure graphic | ✅ Supported (collection) | OK | |
| `<p>` | Paragraphs between graphic and designation | ✅ Mapped | OK | |
| `<non-normative-note>` | Figure notes | ✅ Mapped | OK | |
| `<def-list>` | Figure key (IEC) | ✅ Mapped on NisoSts::Figure | OK | |
| `<table-wrap>` | Figure key (ISO) | ✅ Mapped | OK | |

### Sub-figures (Section 8.2)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<fig-group>` | Sub-figure container (IEC) | `NisoSts::FigGroup` | ✅ Supported | |
| `<fig>` in `<fig-group>` | Sub-figures | ✅ Supported | OK | |
| `<label>` / `<caption>` on `<graphic>` | Sub-figure caption (ISO) | ❌ Not supported | Missing | ISO uses `<label>` and `<caption>` as children of `<graphic>` |

### Figure Key (Section 8.3)

| Coding | Guidelines Usage | sts-ruby Model | Status | Notes |
|--------|-----------------|---------------|--------|-------|
| ISO: `<table-wrap content-type="fig-index">` | Figure key as table | ✅ TableWrap has `@content-type` | OK | |
| IEC: `<def-list list-content="figure">` | Figure key as def-list | ⚠️ Partial | DefList has `@list-type` but guidelines use `@list-content` |

## Attribute Gaps

### TableWrap

| Attribute | Guidelines Usage | Modeled | Status |
|-----------|-----------------|---------|--------|
| `@id` | Table ID | ✅ | OK |
| `@orientation` | landscape/portrait | ✅ | OK |
| `@position` | float/anchor | ✅ | OK |
| `@content-type` | Table type | ✅ | OK |
| `@specific-use` | Layout instruction | ✅ | OK |
| `@width` on `<table>` | Table width | ✅ | OK |
| `@style` on `<td>/<th>` | Border styling | ✅ | OK |
| `@rowspan` on `<td>/<th>` | Merged cells | ✅ | OK |
| `@colspan` on `<td>/<th>` | Merged cells | ✅ | OK |
| `@scope` on `<td>/<th>` | Header scope | ✅ | OK |
| `@padding` (via style) | Cell padding | ✅ (via @style) | OK |

### DefList for figure keys

| Attribute | Guidelines Usage | Modeled | Status |
|-----------|-----------------|---------|--------|
| `@list-content` | "formula", "figure", "abbreviation" | ❌ Not mapped | Missing -- DefList has `@list-type` and `@specific-use` but not `@list-content` |

## Table Content Gaps

### TableWrapFoot

| Element | In Guidelines | In TableWrapFoot | Status |
|---------|--------------|-----------------|--------|
| `<fn>` | Table footnotes | ✅ Via `TbxIsoTml::Fn` | OK |
| `<fn-group>` | Footnote group | ✅ | OK |
| `<p>` | Unit statements | ✅ | OK |
| `<non-normative-note>` | Notes | ✅ | OK |
| `<attrib>` | Attribution | ✅ | OK |
| `<permissions>` | Permissions | ✅ | OK |
| `<tr>` (legacy) | Legacy IEC table footnotes | ❌ Not mapped | Legacy IEC puts `<tr><td>` inside `<table-wrap-foot>` -- this is not supported |

### Table Cell Content

| Element | In Guidelines | In Td/Th | Status |
|---------|--------------|----------|--------|
| `<p>` | Cell paragraphs | ✅ | OK |
| `<break>` | Line breaks in cells | ⚠️ Needs verification | Via content model |
| `<list>` | Lists in cells | ✅ | OK |
| `<bold>` | Bold in header cells (ISO) | ✅ | OK |
| `<roman>` | Roman override in header cells (IEC) | ⚠️ Needs verification | |
| `<italic>` | Italic in cells | ✅ | OK |
| `<styled-content>` | Styled cell content | ✅ | OK |
| `<xref>` | Cross-references | ✅ | OK |
| `<sub>` / `<sup>` | Sub/superscript | ✅ | OK |

## Key Gaps

- [ ] **`@list-content` missing on `DefList`**: Guidelines use `<def-list list-content="figure">` for figure keys (IEC, Section 8.3) and `<def-list list-content="formula">` for formula keys (Section 7.5). Only `@list-type` is mapped, not `@list-content`.

- [ ] **`<graphic>` lacks child `<label>` and `<caption>` for ISO sub-figures**: Section 8.2 ISO shows `<graphic xlink:href="fig_1.1" id="fig_1.1"><label>a)</label><caption><title>title</title></caption></graphic>`. The `Graphic` model has no `id`, `label`, or `caption` children.

- [ ] **`TableWrap#label` is plain string**: The label should support mixed content (e.g. `<sup>` for footnote references). NisoSts uses `Label` class for mixed content, but TbxIsoTml::TableWrap maps label as plain string.

- [ ] **Legacy IEC `<table-wrap-foot>` with `<tr>/<td>` children**: Some legacy IEC documents have `<tr><td>` directly inside `<table-wrap-foot>`. Not supported.

- [ ] **`<non-normative-example>` not in `<table-wrap-foot>`**: Guidelines Section 5.6.1 mentions examples in tables. Not mapped in `TableWrapFoot`.

- [ ] **`@content-type="dimension"` on `<p>` in table footer**: Used for unit statements (Section 6.6.5). The `<p>` in `TableWrapFoot` is `NisoSts::Paragraph` which does not have `@content-type`.

- [ ] **Figure `@fig-type` not in IsoSts::Fig**: `IsoSts::Fig` has `fig_type` mapped, so this is OK.

# Section 6: Tables

## Overview
Section 6 covers formal and informal tables, table cell styling (alignment, borders, background color), merged cells, line breaks and lists within tables, and landscape tables.

## Element Coverage

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<table-wrap>` | Formal table container | `TbxIsoTml::TableWrap` | Partial | Missing `@width` attribute; label mapped as `:string` not as `Label` type |
| `<table>` | XHTML table | `TbxIsoTml::Table` | Supported | Has `@border`, `@frame`, `@rules`, `@width`, `@style`, `@cellspacing`, `@cellpadding` |
| `<col>` | Column specification | `TbxIsoTml::Col` | Supported | Has `@width`, `@align`, `@valign`, `@span` |
| `<colgroup>` | Column group | `TbxIsoTml::Colgroup` | Supported | |
| `<thead>` | Table header | `TbxIsoTml::Thead` | Supported | Has `@align`, `@valign`, `@style` |
| `<tbody>` | Table body | `TbxIsoTml::Tbody` | Supported | |
| `<tfoot>` | Table footer (legacy) | `TbxIsoTml::Tfoot` | Supported | |
| `<tr>` | Table row | `TbxIsoTml::Tr` | Supported | |
| `<th>` | Table header cell | `TbxIsoTml::Th` | Supported | Has `@align`, `@valign`, `@colspan`, `@rowspan`, `@style`, children including `<p>`, `<bold>`, `<break>` |
| `<td>` | Table data cell | `TbxIsoTml::Td` | Supported | Has `@align`, `@valign`, `@colspan`, `@rowspan`, `@style`; children include `<p>`, `<list>`, `<xref>`, `<non-normative-note>` |
| `<caption>` | Table caption | `NisoSts::Caption` | Supported | Contains `<title>`, `<p>` |
| `<label>` | Table label | `NisoSts::Label` | Supported | |
| `<table-wrap-foot>` | Table footer wrapper | `TbxIsoTml::TableWrapFoot` | Partial | Missing `@id`; missing `<p content-type="dimension">`; multiple `<fn>` elements not supported |
| `<fn>` | Footnotes in tables | `NisoSts::Fn` / `TbxIsoTml::Fn` | Supported | |
| `<break>` | Line breaks in cells | `NisoSts::Break` / `TbxIsoTml::TableBreak` | Supported | |
| `<array>` | Informal table container | `NisoSts::SectionArray` | Partial | Only supports `<table>`, not colgroup |

## Attribute Gaps

| Attribute | Parent Element | Guidelines Usage | Modeled | Status |
|-----------|---------------|-----------------|---------|--------|
| `@orientation` | `<table-wrap>` | "landscape" / "portrait" | Yes | Supported |
| `@content-type` | `<table-wrap>` | "fig-index" (ISO figure keys), "dimension" | Yes | Supported |
| `@width` | `<table>` | Table width in px or % | Yes | Supported |
| `@width` | `<table-wrap>` | Table wrapper width | No | Missing |
| `@border` | `<table>` | Border width | Yes | Supported |
| `@frame` | `<table>` | Frame type ("box", etc.) | Yes | Supported |
| `@rules` | `<table>` | Rules ("all", "groups", etc.) | Yes | Supported |
| `@style` | `<td>`, `<th>` | Cell styling (borders, background-color) | Yes | Supported |
| `@align` | `<td>`, `<th>`, `<col>`, `<thead>`, `<tbody>` | Horizontal alignment | Yes | Supported |
| `@valign` | `<td>`, `<th>`, `<col>`, `<thead>`, `<tbody>` | Vertical alignment | Yes | Supported |
| `@colspan` | `<td>`, `<th>` | Column spanning | Yes | Supported |
| `@rowspan` | `<td>`, `<th>` | Row spanning | Yes | Supported |
| `@scope` | `<td>`, `<th>` | Scope for accessibility | Yes | Supported |
| `@content-type` | `<p>` (inside `<table-wrap-foot>`) | "dimension" for unit statements | No | `@content-type` missing on `Paragraph` |
| `@id` | `<table-wrap-foot>` | Element identifier | No | Missing on `TableWrapFoot` |

## Key Gaps
- [ ] `TbxIsoTml::TableWrap` maps `<label>` as `:string` instead of `NisoSts::Label` type -- label can contain `<sup>` markup for footnote markers
- [ ] `TbxIsoTml::TableWrapFoot` missing `@id` attribute
- [ ] `TbxIsoTml::TableWrapFoot` only supports single `<fn>` -- guidelines show multiple `<fn>` elements in table footers
- [ ] `TbxIsoTml::TableWrapFoot` missing multiple `<p>` children -- guidelines show `<p content-type="dimension">` for unit statements
- [ ] `TbxIsoTml::TableWrapFoot` missing `<tr>` as child -- legacy IEC coding has `<tr>` inside `<table-wrap-foot>` (B.2.14)
- [ ] `NisoSts::Paragraph` missing `@content-type` attribute -- needed for `<p content-type="dimension">` in table footers

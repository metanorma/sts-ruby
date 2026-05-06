# Schema Element Coverage: mnconvert XSD vs sts-ruby

**Source**: NISO STS Extended 1.0 MathML3 XSD from mnconvert
**Date**: 2026-05-06
**Method**: Extracted all `xsd:element name=` declarations from XSD schema files, compared against all `map_element` and `element` declarations in sts-ruby.

## Summary

| Metric | Count |
|--------|-------|
| XSD-defined elements | 374 |
| Ruby-mapped elements | 470* |
| Missing from Ruby | 52 |
| Extra in Ruby (not in XSD) | ~150** |

*Ruby count includes TBX, MathML, and content group helper elements that may map to the same XML element name with different namespace/module prefixes.

**Extra Ruby elements include TBX elements (urn:iso:std:iso:30042:ed-1 namespace), MathML elements, and internal helpers.

## Elements in XSD but NOT in sts-ruby

### Critical (Structural / Round-trip Impact)

| Element | Parent(s) in XSD | Notes |
|---------|-----------------|-------|
| `code` | Paragraph, Section, ListItem | Code blocks — entirely missing |
| `index` | Back | Index container |
| `index-div` | Index | Index division |
| `index-entry` | IndexDiv | Index entry |
| `index-group` | Sec, App | Index group |
| `index-title-group` | IndexDiv | Index title |
| `index-term-range-end` | IndexEntry | Range end marker |
| `table-wrap-group` | Sec, App | Grouped tables |
| `toc` | Front | Table of contents |
| `toc-div` | Toc | TOC division |
| `toc-entry` | TocDiv | TOC entry |
| `toc-group` | Sec | TOC group |
| `toc-title-group` | Toc | TOC title |
| `sec-meta` | Sec | Section metadata |
| `std-doc-meta` | Front | Standard document metadata |

### Table Model (OASIS CALS)

| Element | Notes |
|---------|-------|
| `tgroup` | OASIS table group — alternative to XHTML table model |
| `colspec` | Column specification for OASIS tables |
| `row` | Row in OASIS table |
| `entry` | Cell in OASIS table |

sts-ruby only supports XHTML-style `<table>` with `<tr>/<td>/<th>`. OASIS CALS table model (`<tgroup>/<colspec>/<row>/<entry>`) is unimplemented.

### Less Critical / Edge Cases

| Element | Notes |
|---------|-------|
| `abbrev` | Abbreviation element (abbreviation display) |
| `article-categories` | JATS legacy — not used in NISO STS |
| `article-id` | JATS legacy |
| `article-meta` | JATS legacy |
| `compl-title-wrap` | Complementary title wrap |
| `compound-subject` | Compound subject |
| `compound-subject-part` | Part of compound subject |
| `count` | Count element |
| `externalCrossReference` | TBX external cross reference |
| `fallback` | Alternatives fallback |
| `fixed-case` | Fixed-case text |
| `free_to_read` | ALI free-to-read indicator |
| `glyph-data` | Private character glyph data |
| `glyph-ref` | Private character glyph reference |
| `include` | XInclude element |
| `intro-title-wrap` | Introduction title wrap |
| `issue-id` | Journal issue ID |
| `issue-part` | Journal issue part |
| `issue-sponsor` | Journal issue sponsor |
| `issue-title` | Journal issue title |
| `journal-id` | Journal ID |
| `license_ref` | ALI license reference (ali:license_ref) |
| `main-title-wrap` | Main title wrap |
| `nav-pointer` | Navigation pointer |
| `nav-pointer-group` | Navigation pointer group |
| `num` | Number element |
| `overline-end` | Overline end marker |
| `overline-start` | Overline start marker |
| `part-title` | Part title |
| `see-also-entry` | Index "see also" entry |
| `see-entry` | Index "see" entry |
| `sub-part` | Sub-part element |
| `title-group` | Title group |
| `trans-subtitle` | Translated subtitle |
| `underline-end` | Underline end marker |
| `underline-start` | Underline start marker |
| `x` | MathML x element |
| `xMathML` | Content MathML |

## Recommendations

1. **Immediate priority**: `code`, `index/*`, `toc/*`, `table-wrap-group` — these appear in real ISO documents
2. **OASIS table model**: Consider if needed — most modern ISO documents use XHTML tables
3. **JATS legacy elements**: Skip — not relevant for NISO STS standards documents
4. **ALI namespace elements** (`free_to_read`, `license_ref`): Add when supporting ALI permissions

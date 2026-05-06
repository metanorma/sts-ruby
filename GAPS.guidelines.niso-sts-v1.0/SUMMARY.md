# NISO STS 1.0 Guidelines Audit: sts-ruby Gap Report Summary

**Date**: 2026-05-06
**Source**: NISO STS 1.0 - IEC/ISO Coding Guidelines (v. 1.0 / 2021-01-01)
**Audited against**: sts-ruby (branch rt-enhance-private)

## Model Inventory

| Namespace | Classes | Directory |
|-----------|---------|-----------|
| NisoSts | 285 | lib/sts/niso_sts/ |
| IsoSts | 76 | lib/sts/iso_sts/ |
| TbxIsoTml | 52 | lib/sts/tbx_iso_tml/ |
| Sts::Mathml | 1 | lib/sts/mathml.rb |

## Overall Assessment

sts-ruby provides **good foundational coverage** of the NISO STS 1.0 element set. All major structural elements (`<standard>`, `<front>`, `<body>`, `<back>`, `<sec>`, `<app>`, `<fig>`, `<table-wrap>`, `<p>`, `<list>`, `<xref>`, `<std>`, etc.) are modeled. The TBX terminology support is comprehensive with `termEntry`, `langSet`, `tig`, and related elements.

However, there are significant gaps in several areas that would prevent full round-trip fidelity with real-world NISO STS documents.

## Critical Gaps (Prevent Round-Trip Fidelity)

### 1. Missing Elements (No Model Exists)

| Element | Section | Impact |
|---------|---------|--------|
| `<index>` hierarchy (index, index-div, index-entry, index-title-group, see-entry, related-object) | 4.4.4 | Back matter index content lost |
| `<code>` with 7 attributes | 5.12 | Programming code content lost |

### 2. Incomplete Models (Exist but Missing Critical Parts)

| Model | Missing Parts | Impact |
|-------|--------------|--------|
| `Permissions` | `<license>`, `<license-p>`, `<license_ref>`, rich `<copyright-statement>` | IEC metadata with full license text lost |
| `EditingInstruction` | `@content-type`, `<p>` child | IEC amendment instructions degraded to empty elements |
| `TermDisplay` | `<term>`, `<def>`, `<list>`, `<xref>`, `<label>` | IEC term-display content lost |
| `DefList` | `@list-content` attribute | Formula/figure/abbreviation keys lose semantic meaning |
| `Graphic` | `@id`, `<label>`, `<caption>` children | ISO sub-figure captions lost |
| `Front` (NisoSts) | `<std-doc-meta>` wiring, multiple `<std-meta>` | Adoption documents and national metadata lost |
| `BoxedText` | Most valid children (table-wrap, fig, disp-formula, etc.) | Guidance boxes with complex content degraded |

### 3. Missing Child Element Wiring

| Parent | Missing Child | Impact |
|--------|--------------|--------|
| `<p>` (Paragraph) | `@content-type`, `<supplementary-material>`, `<inline-graphic>` | Unit statements and supplementary materials lost |
| `<sec>` (Section) | `<supplementary-material>`, `<normative-note>`, `<normative-example>`, `<code>`, `<media>` | Various content types lost |
| `<ref>` (Reference) | `<non-normative-note>` | Notes on references lost |
| `<std>` (ReferenceStandard) | `<styled-content>`, `<italic>` | IEC amendment styled content lost |

### 4. Type Mismatches

| Model | Current | Should Be | Impact |
|-------|---------|-----------|--------|
| `Permissions#copyright_statement` | String | Structured (mixed content) | IEC inline-graphic and breaks lost |
| `Permissions#copyright_holder` | Single string | Collection | Multiple holders lost |
| `MetadataIso` fields (title_wrap, std_ref, etc.) | Single | Collection | Multi-language/multi-value data lost |
| `MetadataStd#page_count` | Direct | Wrapped in `<counts>` | IEC counts wrapper lost |
| `TableWrap#label` | String | Label (mixed content) | Superscript footnote markers lost |

## Medium-Priority Gaps

| Gap | Section | Notes |
|-----|---------|-------|
| `<abstract>` not in metadata models | A.2 | IEC metadata includes abstracts |
| `<isbn>`, `<suppl-type>`, `<suppl-number>` not in `StandardIdentification` | A.2 | IEC std-ident includes these |
| `@originator` missing from `StdId` | A.2 | IEC std-id uses this attribute |
| `<comm-ref>` should support `@id` | A.2 | IEC comm-ref has ID attribute |
| MathML coverage limited (~16 of 35+ elements) | 7.6 | Complex formulae may not round-trip |
| `DefItem` missing `@id` | 10.1.5 | Abbreviation cross-references need ID |

## Low-Priority Gaps

| Gap | Section | Notes |
|-----|---------|-------|
| Legacy IEC `<def-head>` vs `<label>` | 7.5 | Legacy only |
| Legacy IEC `<tfoot>` in tables | 6.6.3 | Legacy only |
| Legacy IEC `<tr>/<td>` in `<table-wrap-foot>` | 6.6.3 | Legacy only |
| `<editing-instruction>` `@content-type` (legacy) | 5.14 | Dropped in recent conversion |
| Text between disp-formula in disp-formula-group | 7.4 | Edge case |

## Files in This Report

| File | Topic |
|------|-------|
| `01-introduction-scope.md` | Sections 1-3: Introduction, scope, conventions |
| `02-document-structure.md` | Section 4: Overall document structure |
| `03-front-matter.md` | Section 4.2: Metadata elements |
| `04-body-content.md` | Section 5: Body content elements |
| `05-tables-figures.md` | Sections 6, 8: Tables and figures |
| `06-math-formulae.md` | Section 7: Formulae and MathML |
| `07-references.md` | Section 10: Cross-references and bibliography |
| `08-terminology.md` | Section 9: TBX and term-display |
| `09-metadata.md` | Annex A: Metadata usage |
| `10-iso-iec-variant.md` | ISO/IEC variants, amendments, ID schemes |

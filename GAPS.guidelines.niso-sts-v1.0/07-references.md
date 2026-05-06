# Section 10: References

## Overview
Covers internal cross-references (`<xref>`), external references (`<std>`, `<mixed-citation>`), footnotes (`<fn>`), URLs (`<uri>`, `<ext-link>`), bibliography structure, and reference elements.

## Element Coverage

### Internal Cross-References (Section 10.1)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<xref>` | Cross-reference element | `TbxIsoTml::Xref` | ✅ Supported | |
| `@ref-type` | Type of target | ✅ Mapped | OK | Values: app, bibr, disp-formula, fig, fn, list, sec, table, table-fn, other |
| `@rid` | ID of target | ✅ Mapped | OK | |
| `<sup>` in `<xref>` | Superscript footnote refs | ✅ Mapped | OK | |
| `text content` | Reference text | ✅ Mapped | OK | |

### External References (Section 10.2)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<std>` | Reference to a standard | `NisoSts::ReferenceStandard` | ✅ Supported | |
| `@type` on `<std>` | dated/undated | ✅ Mapped | OK | |
| `@std-id` on `<std>` | Standard ID | ✅ Mapped | OK | |
| `<std-ref>` | Standard reference text | `NisoSts::StandardRef` | ✅ Supported | |
| `<std-id>` in `<std>` | Standard identifier | ✅ Mapped via `StdId` | OK | |
| `<std-id-group>` | Group of IDs | ✅ Mapped | OK | |
| `<title>` in `<std>` | Title of referenced standard | ✅ Mapped | OK | |
| `<mixed-citation>` | Non-standard reference | `NisoSts::MixedCitation` | ✅ Supported | Rich content model |
| `<uri>` | URL references | `NisoSts::Uri` | ✅ Supported | |
| `<ext-link>` | External links | `NisoSts::ExtLink` | ✅ Supported | With `@xlink:href` |

### Footnotes (Section 10.1.4)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<fn>` | Footnote content | `NisoSts::Fn`, `TbxIsoTml::Fn` | ✅ Supported | |
| `@id` on `<fn>` | Footnote ID | ✅ Mapped | OK | |
| `<label>` in `<fn>` | Footnote label | ✅ Mapped | OK | |
| `<p>` in `<fn>` | Footnote text | ✅ Mapped | OK | |
| `<fn-group>` | Footnote group (IEC legacy) | `NisoSts::FnGroup`, `TbxIsoTml::FnGroup` | ✅ Supported | |

### Bibliography (Section 4.4.3)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<ref-list>` | Bibliography container | `NisoSts::ReferenceList` | ✅ Supported | |
| `@content-type="bibl"` | Bibliography marker | ✅ Mapped | OK | |
| `@id` | Bibliography ID (sec_bibl / sec-bibliography) | ✅ Mapped | OK | |
| `<title>` | "Bibliography" | ✅ Mapped | OK | |
| `<ref>` | Individual reference | `NisoSts::Reference` | ✅ Supported | |
| `@id` on `<ref>` | Reference ID (biblref_1 / bib-1) | ✅ Mapped | OK | |
| `<label>` in `<ref>` | Reference label "[1]" | ✅ Mapped | OK | |
| `<std>` in `<ref>` | Standard reference | ✅ Mapped | OK | |
| `<mixed-citation>` in `<ref>` | Non-standard reference | ✅ Mapped | OK | |
| Nested `<ref-list>` | Subdivided bibliography | ✅ Mapped (collection) | OK | |
| `<non-normative-note>` in `<ref>` | Notes on references | ❌ Not mapped in Reference | Missing | Guidelines show this in Section 4.4.3 |

### Abbreviations (Section 10.1.5)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<def-list list-content="abbreviation">` | Abbreviation list | ⚠️ Partial | DefList exists but `@list-content` not mapped | |
| `<def-item>` with `@id` | Abbreviation entry | ✅ Mapped (DefItem has `@specific-use` but not `@id`) | ⚠️ Partial | |
| `<term>` | Abbreviation | ✅ Mapped | OK | |
| `<def>` | Definition | ✅ Mapped | OK | |

## Attribute Gaps

| Attribute | Parent Element | Guidelines Usage | Modeled | Status |
|-----------|---------------|-----------------|---------|--------|
| `@ref-type` on `<xref>` | All cross-references | ✅ | OK | |
| `@rid` on `<xref>` | Target ID | ✅ | OK | |
| `@type` on `<std>` | dated/undated | ✅ | OK | |
| `@std-id-link-type` on `<std-id>` | Link type (urn, id, ooi) | ✅ | OK | |
| `@std-id-type` on `<std-id>` | ID type (dated, undated) | ✅ | OK | |
| `@originator` on `<std-id>` | Originating body | ❌ Not mapped | Missing | IEC metadata example shows this |
| `@xlink:type` on `<mixed-citation>` | XLink type | ✅ | OK | |
| `@publication-type` on `<mixed-citation>` | Publication type | ✅ | OK | |
| `@content-type` on `<ref>` | Reference type | ✅ | OK | |
| `@specific-use` on `<ref>` | IEC delete marker | ❌ Not mapped | Missing | IEC amendments use `@specific-use="delete"` on `<ref>` |
| `@list-content` on `<def-list>` | "abbreviation" | ❌ Not mapped | Missing | |

## ReferenceStandard Gaps

The `ReferenceStandard` model maps `<std>` content:

| Feature | Guidelines Usage | In ReferenceStandard | Status |
|---------|-----------------|---------------------|--------|
| `<std-ref>` | Standard reference text | ✅ | OK |
| `<title>` | Standard title | ✅ | OK |
| `<std-id>` | Standard identifier | ✅ Via `StdId` | OK |
| `<std-id-group>` | ID group | ✅ | OK |
| `<fn>` | Footnotes | ✅ | OK |
| `<xref>` | Cross-references | ✅ | OK |
| `<bold>` | Bold text | ✅ | OK |
| `<styled-content>` | Styled content | ❌ Not mapped | IEC amendments use `<styled-content specific-use="delete">` inside `<std>` |
| `<italic>` | Italic text | ❌ Not mapped | May appear in std content |
| Mixed text content | e.g. ", 7.3.1" after std-ref | ✅ (via mixed_content) | OK |

## Key Gaps

- [ ] **`<non-normative-note>` not mapped in `Reference`**: Guidelines show `<non-normative-note>` inside `<ref>` in normative references (Section 4.3.3 case 2 example with "W3C XML Schema").

- [ ] **`@list-content` not mapped on `DefList`**: Critical for abbreviation lists (Section 10.1.5), formula keys (Section 7.5), and figure keys (Section 8.3).

- [ ] **`@originator` missing on `StdId`**: IEC metadata example shows `<std-id originator="IEC" std-id-link-type="urn" std-id-type="dated">`.

- [ ] **`<styled-content>` not in `ReferenceStandard`**: IEC amendments use `<styled-content specific-use="delete">` and `<styled-content specific-use="insert">` inside `<std>` elements (Section 5.5.1 examples).

- [ ] **`@specific-use` not on `Reference`**: IEC amendments use `<ref specific-use="delete">` to mark deleted references.

- [ ] **`DefItem` missing `@id`**: Abbreviation cross-references use `<def-item id="abb-acsi">` (Section 10.1.5). Currently `DefItem` has `@specific-use` but not `@id`.

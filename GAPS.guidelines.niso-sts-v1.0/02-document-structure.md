# Section 4: Document Structure

## Overview
Covers the overall document structure: root `<standard>` element, front matter (`<front>`), body (`<body>`), back matter (`<back>`), clauses (`<sec>`), annexes (`<app>`), bibliography (`<ref-list>`), index, and footnotes.

## Element Coverage

### Root and Major Structural Elements

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<standard>` | Root element | `NisoSts::Standard`, `IsoSts::Standard` | ✅ Supported | |
| `<front>` | Front matter container | `NisoSts::Front`, `IsoSts::Front` | ✅ Supported | |
| `<body>` | Body content | `NisoSts::Body`, `IsoSts::Body` | ✅ Supported | |
| `<back>` | Back matter | `NisoSts::Back`, `IsoSts::Back` | ✅ Supported | |

### Front Matter (Section 4.2)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<std-meta>` | Standards organization metadata | `NisoSts::MetadataStd` | ✅ Supported | |
| `<iso-meta>` | ISO-specific metadata (legacy) | `NisoSts::MetadataIso`, `IsoSts::IsoMeta` | ✅ Supported | Both NisoSts and IsoSts variants |
| `<reg-meta>` | Regional metadata | `NisoSts::RegMeta`, `IsoSts::RegMeta` | ✅ Supported | |
| `<nat-meta>` | National metadata | `NisoSts::NatMeta`, `IsoSts::NatMeta` | ✅ Supported | |
| `<std-doc-meta>` | Document-level metadata | `NisoSts::StdDocMeta` | ✅ Supported | NisoSts only; NOT in IsoSts::Front |
| `<sec>` (foreword) | Foreword section | `NisoSts::Section` with `sec-type="foreword"` | ✅ Supported | |
| `<sec>` (introduction) | Introduction section | `NisoSts::Section` with `sec-type="intro"` | ✅ Supported | |

### Clauses (Section 4.3)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<sec>` | Clause/subclause | `NisoSts::Section`, `IsoSts::Sec` | ✅ Supported | |
| `<label>` | Clause number | `NisoSts::Label`, `IsoSts::Label` | ✅ Supported | |
| `<title>` | Clause title | `NisoSts::Title`, `IsoSts::Title` | ✅ Supported | |
| `<p>` | Paragraph text | `NisoSts::Paragraph`, `IsoSts::Paragraph` | ✅ Supported | |

### Back Matter (Section 4.4)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<app-group>` | Annex group container | `NisoSts::AppGroup`, `IsoSts::AppGroup` | ✅ Supported | |
| `<app>` | Individual annex | `NisoSts::App`, `IsoSts::App` | ✅ Supported | |
| `<annex-type>` | Annex type label (informative/normative) | `NisoSts::App#annex_type` (string), `IsoSts::AnnexType` | ✅ Supported | |
| `<ref-list>` (bibliography) | Bibliography | `NisoSts::ReferenceList`, `IsoSts::RefList` | ✅ Supported | |
| `<index>` | Index element | **MISSING** | ❌ Missing | No `Index` class found in NisoSts or IsoSts |
| `<index-title-group>` | Index title group | **MISSING** | ❌ Missing | |
| `<index-div>` | Index division | **MISSING** | ❌ Missing | |
| `<index-entry>` | Index entry | **MISSING** | ❌ Missing | |
| `<see-entry>` | See-entry in index | **MISSING** | ❌ Missing | `NisoSts::See` exists but for def-list, not index |
| `<related-object>` | Related object reference | **MISSING** | ❌ Missing | |
| `<fn-group>` | Footnote group (IEC legacy) | `NisoSts::FnGroup`, `IsoSts::FnGroup` | ✅ Supported | |

## Attribute Gaps

| Attribute | Parent Element | Guidelines Usage | Modeled | Status |
|-----------|---------------|-----------------|---------|--------|
| `@sec-type` | `<sec>` | Clause type (foreword/intro/scope/norm-refs/terms) | ✅ Mapped as `type` in NisoSts, `sec_type` in IsoSts | OK |
| `@content-type` | `<app>` | inform-annex / normative-annex / informative / normative | ✅ Mapped | OK |
| `@content-type` | `<ref-list>` | "bibl" for bibliography | ✅ Mapped | OK |
| `@content-type` | `<ref-list>` (nested) | "norm-refs" for normative references | ✅ Mapped | OK |
| `@id` | `<sec>` | Section identifiers | ✅ Mapped | OK |
| `@id` | `<app>` | Annex identifiers | ✅ Mapped | OK |
| `@id` | `<ref-list>` | Bibliography identifiers | ✅ Mapped | OK |

## NisoSts::Front Gaps

| Feature | Guideline Reference | Status | Notes |
|---------|-------------------|--------|-------|
| `<std-doc-meta>` in `<front>` | Section 4.2.2 | ❌ Missing from NisoSts::Front | `StdDocMeta` class exists but is NOT mapped in `NisoSts::Front` -- only `iso_meta`, `std_meta`, and `sec` are mapped |
| `<std-doc-meta>` in IsoSts::Front | Section 4.2.2 | ❌ Missing | Not present in IsoSts::Front either |
| Multiple `<std-meta>` elements | Section A.3 | ⚠️ Limited | `NisoSts::Front` maps `std_meta` as single (not collection), but guidelines say multiple instances are allowed for national metadata |
| `<sec>` in front for Foreword/Introduction | Section 4.2.3, 4.2.4 | ✅ Supported | `NisoSts::Front` maps `sec` as collection |

## NisoSts::Section Content Gaps

| Child Element | Guidelines Usage | In NisoSts::Section | In IsoSts::Sec | Notes |
|--------------|-----------------|---------------------|----------------|-------|
| `<code>` | Programming code | ❌ Missing | ❌ Missing | No `Code` class exists in sts-ruby |
| `<supplementary-material>` | Supplementary materials | ❌ Missing from Section | ❌ Missing | Class exists (`NisoSts::SupplementaryMaterial`) but not mapped as child of Section or IsoSts::Sec |
| `<normative-note>` | Normative notes | ❌ Missing from Section | ❌ Missing | `NisoSts::NormativeNote` class exists but not mapped in Section; only `non-normative-note` is mapped |
| `<normative-example>` | Normative examples | ❌ Missing from Section | ❌ Missing | `NisoSts::NormativeExample` class exists but not mapped |
| `<media>` | Media element | ❌ Missing | ❌ Missing | No `Media` class mapped in Section |
| `<chem-struct>` | Chemical structure | ❌ Missing | ❌ Missing | `ChemStruct` class exists but not mapped in Section |

## Key Gaps

- [ ] **`<index>` element missing entirely**: No `Index`, `IndexDiv`, `IndexEntry`, `IndexTitleGroup`, `SeeEntry`, or `RelatedObject` classes exist. The guidelines show full index coding (Section 4.4.4) with `<index>`, `<index-title-group>`, `<index-div>`, `<index-entry>`, `<see-entry>`, `<related-object>`. These need to be implemented.

- [ ] **`<std-doc-meta>` not mapped in Front**: The `StdDocMeta` class exists but is not wired into either `NisoSts::Front` or `IsoSts::Front`. Per Section 4.2.2, this element captures document-level metadata.

- [ ] **`NisoSts::Front` lacks `<std-doc-meta>` and multiple `<std-meta>` support**: Guidelines allow multiple `<std-meta>` instances for national metadata. Currently only a single `std_meta` is mapped.

- [ ] **`<code>` element not modeled**: Section 5.12 describes `<code>` with attributes `@id`, `@code-type`, `@code-version`, `@executable`, `@language`, `@language-version`, `@platforms`. No `Code` class exists.

- [ ] **`<supplementary-material>` not available as child of `<sec>`**: Used in IEC forewords for interpretation sheets and software supplements (Section on IEC ISH). Class exists but not wired into Section.

- [ ] **`<normative-note>` and `<normative-example>` not in Section**: Classes exist (`NisoSts::NormativeNote`, `NisoSts::NormativeExample`) but are not mapped as children of `<sec>`. Some clause types require normative notes.

- [ ] **`NisoSts::Back` missing `<index>`**: Index should appear after bibliography and before footnote groups in back matter.

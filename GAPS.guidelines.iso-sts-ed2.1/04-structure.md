# Section 4: Structure

## Overview
Section 4 defines the document structure: front matter, body, and back matter. It covers metadata, foreword, introduction, clauses/subclauses, normative references, terms and definitions, annexes, and bibliography.

## Element Coverage

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<standard>` | Root element | `NisoSts::Standard` | Partial | Missing `<processing-meta>` child |
| `<front>` | Front matter container | `NisoSts::Front` | Partial | Missing `<std-doc-meta>` child; missing `<adoption-front>` |
| `<body>` | Body container | `NisoSts::Body` | Supported | |
| `<back>` | Back matter container | `NisoSts::Back` | Partial | Missing `<index>` child |
| `<std-meta>` | Standards metadata | `NisoSts::MetadataStd` | Partial | Missing `<abstract>`, multiple `<permissions>`, `<license>` inside permissions, `<isbn>`, `<std-id-group>` inside `<std-ident>`, `<counts>`, `<suppl-type>`, `<suppl-number>`, `<suppl-version>` |
| `<iso-meta>` | ISO-specific legacy metadata | `NisoSts::MetadataIso` | Partial | Deprecated per guidelines but still needed for legacy |
| `<std-doc-meta>` | Document-level metadata | `NisoSts::StdDocMeta` | Partial | Not mapped in `NisoSts::Front` |
| `<sec>` | Clauses and subclauses | `NisoSts::Section` | Supported | `@sec-type` mapped as `:type` |
| `<label>` | Clause/formula/figure numbers | `NisoSts::Label` | Supported | |
| `<title>` | Section/figure/table titles | `NisoSts::Title` | Supported | |
| `<p>` | Paragraphs | `NisoSts::Paragraph` | Supported | |
| `<ref-list>` | Normative refs and bibliography | `NisoSts::ReferenceList` | Supported | Has `@content-type` |
| `<ref>` | Individual reference | `NisoSts::Reference` | Partial | Missing `<non-normative-note>` child, missing `@specific-use` |
| `<std>` | Standard reference | `NisoSts::ReferenceStandard` | Partial | Missing `@content-type`, `@std-id` vs `@std-id-link-type`, `<std-id>` children not mapped |
| `<std-id>` | Standard identifier (URN, etc.) | `NisoSts::StdId` | Supported | |
| `<std-ref>` | Standard reference text | `NisoSts::StandardRef` | Supported | |
| `<mixed-citation>` | Non-standard references | `NisoSts::MixedCitation` | Partial | Missing `@id`, `<uri>`, `<break>` children |
| `<title-wrap>` | Title grouping with `@xml:lang` | `NisoSts::TitleWrap` | Supported | |
| `<proj-id>` | Project ID | `NisoSts::ProjId` | Supported | |
| `<std-ident>` | Standard identification block | `NisoSts::StandardIdentification` | Partial | Missing `<isbn>`, `<std-id-group>`, `<suppl-type/number/version>` |
| `<app-group>` | Annex group container | `NisoSts::AppGroup` | Supported | |
| `<app>` | Individual annex | `NisoSts::App` | Supported | Has `@content-type`, `<annex-type>` |
| `<annex-type>` | Annex type text (informative/normative) | Mapped as `:string` | Supported | |
| `<content-language>` | Document language | `NisoSts::ContentLanguage` | Supported | |
| `<permissions>` | Copyright info | `NisoSts::Permissions` | Partial | Missing `<license>` child; `copyright-statement` should allow markup not just string |
| `<license>` | License within permissions | `NisoSts::License` | Supported | Not mapped as child of Permissions |
| `<license-p>` | License paragraph | `NisoSts::LicenseP` | Supported | |
| `<custom-meta-group>` | Custom metadata group | `NisoSts::CustomMetaGroup` | Supported | |
| `<custom-meta>` | Custom metadata entry | `NisoSts::CustomMeta` | Supported | |
| `<meta-name>` | Custom metadata name | `NisoSts::CustomMeta` (attr) | Supported | |
| `<meta-value>` | Custom metadata value | `NisoSts::CustomMeta` (attr) | Supported | |
| `<index>` | Back matter index | Missing | Missing | Not modeled -- legacy but still referenced |
| `<self-uri>` | Self-reference URI | `NisoSts::SelfUri` | Supported | |

## Attribute Gaps

| Attribute | Parent Element | Guidelines Usage | Modeled | Status |
|-----------|---------------|-----------------|---------|--------|
| `@sec-type` | `<sec>` | "foreword", "intro", "scope", "norm-refs", "terms", "numbered-paragraph" | Yes (as `:type`) | Supported |
| `@content-type` | `<app>` | "informative" / "normative" | Yes | Supported |
| `@content-type` | `<ref-list>` | "norm-refs", "bibl" | Yes | Supported |
| `@xml:lang` | `<title-wrap>` | Language code | Yes (via TitleWrap) | Supported |
| `@type` | `<std-ref>` | "dated" / "undated" | Yes | Supported |
| `@std-id-link-type` | `<std-id>` | "urn" | Yes | Supported |
| `@std-id-type` | `<std-id>` | "dated" / "undated" | Yes | Supported |
| `@orientation` | `<table-wrap>` | "landscape" / "portrait" | Yes | Supported |
| `@specific-use` | `<ref>` | "delete" (IEC amendments) | No | Missing |

## Key Gaps
- [ ] **CRITICAL**: `<processing-meta>` not modeled as child of `<standard>` -- introduced in Ed 2.1
- [ ] **CRITICAL**: `NisoSts::Front` does not map `<std-doc-meta>` as a child element
- [ ] `NisoSts::Front` does not support `<adoption-front>` as child (it's on `Adoption` but not `Front`)
- [ ] `NisoSts::Permissions` does not contain `<license>` as a child element -- guidelines show `<license>` inside `<permissions>` (IEC example)
- [ ] `NisoSts::Permissions` maps `copyright-statement` as `:string` but guidelines show it can contain `<inline-graphic>` and mixed content (IEC example)
- [ ] `NisoSts::Permissions` does not support multiple `<copyright-holder>` elements (needed for B.4.2)
- [ ] `NisoSts::Reference` missing `<non-normative-note>` as a child (B.2.4)
- [ ] `NisoSts::Reference` missing `@specific-use` attribute (for IEC amendments "delete")
- [ ] `NisoSts::ReferenceStandard` missing `@content-type` attribute (used for "uri")
- [ ] `NisoSts::MixedCitation` missing `@id` attribute
- [ ] `<index>` element not modeled at all (legacy but still used in traditional production chain)
- [ ] `NisoSts::MetadataStd` missing `<abstract>` as a child (shown in IEC metadata C.2)
- [ ] `NisoSts::MetadataStd` missing `<isbn>` as a child (shown in IEC metadata C.2)
- [ ] `NisoSts::MetadataStd` missing `<suppl-type>`, `<suppl-number>`, `<suppl-version>` (shown in IEC metadata)
- [ ] `NisoSts::MetadataStd` missing `<counts>` child (shown in IEC metadata)
- [ ] `NisoSts::MetadataStd` missing `<license_ref>` child (shown in IEC metadata example, under `<license>`)
- [ ] `NisoSts::MetadataStd` only allows single `<permissions>` but IEC uses multiple (B.2.1)

# Section 4.2: Front Matter (Metadata)

## Overview
Covers the metadata elements within `<front>`: `<std-meta>`, `<iso-meta>`, `<reg-meta>`, `<nat-meta>`, and `<std-doc-meta>`, along with their child elements for titles, identifiers, dates, permissions, and other metadata.

## Element Coverage

### Metadata Container Elements

| Element | sts-ruby Model | Status | Notes |
|---------|---------------|--------|-------|
| `<std-meta>` | `NisoSts::MetadataStd` | ✅ Supported | Primary metadata container |
| `<iso-meta>` | `NisoSts::MetadataIso` | ✅ Supported | Legacy ISO metadata |
| `<iso-meta>` | `IsoSts::IsoMeta` | ✅ Supported | IsoSts variant |
| `<reg-meta>` | `NisoSts::RegMeta`, `IsoSts::RegMeta` | ✅ Supported | |
| `<nat-meta>` | `NisoSts::NatMeta`, `IsoSts::NatMeta` | ✅ Supported | |
| `<std-doc-meta>` | `NisoSts::StdDocMeta` | ⚠️ Class exists | Not wired into `NisoSts::Front` or `IsoSts::Front` |

### Title Elements

| Element | sts-ruby Model | Status | Notes |
|---------|---------------|--------|-------|
| `<title-wrap>` | `NisoSts::TitleWrap` | ✅ Supported | |
| `@xml:lang` on `<title-wrap>` | `TitleWrap#lang` | ✅ Supported | Uses `XmlLangType` |
| `<intro>` | `TitleWrap#intro` (string) | ✅ Supported | |
| `<main>` | `TitleWrap#main` (string) | ✅ Supported | |
| `<compl>` | `NisoSts::TitleCompl` | ✅ Supported | Inherits from `TitleFull` |
| `<full>` | `NisoSts::TitleFull` | ✅ Supported | |

### Identification Elements

| Element | sts-ruby Model | Status | Notes |
|---------|---------------|--------|-------|
| `<proj-id>` | `NisoSts::ProjId` | ✅ Supported | In MetadataStd |
| `<std-ident>` | `NisoSts::StandardIdentification` | ✅ Supported | |
| `<originator>` | `StandardIdentification#originator` | ✅ Supported | |
| `<doc-type>` | `StandardIdentification#doc_type` | ✅ Supported | |
| `<doc-number>` | `StandardIdentification#doc_number` | ✅ Supported | |
| `<part-number>` | `StandardIdentification#part_number` | ✅ Supported | |
| `<edition>` | `StandardIdentification#edition` | ✅ Supported | |
| `<version>` | `StandardIdentification#version` | ✅ Supported | |
| `<doc-ident>` | `NisoSts::DocumentIdentification` | ✅ Supported | ISO legacy only |
| `<std-id-group>` | `NisoSts::StdIdGroup` | ✅ Supported | |
| `<std-id>` | `NisoSts::StdId` | ✅ Supported | With `@std-id-link-type`, `@std-id-type` |
| `<isbn>` | `NisoSts::Isbn` | ✅ In mixed-citation only | Not in MetadataStd |
| `<suppl-type>` | `NisoSts::SupplType` | ✅ Class exists | |
| `<suppl-number>` | `NisoSts::SupplNumber` | ✅ Class exists | |
| `<suppl-version>` | `NisoSts::SupplVersion` | ✅ Class exists | |

### Organization Elements

| Element | sts-ruby Model | Status | Notes |
|---------|---------------|--------|-------|
| `<std-org>` | `NisoSts::StdOrg` | ✅ Supported | |
| `@std-org-type` | `StdOrg#std_org_type` | ✅ Supported | |
| `@std-org-role` | `StdOrg#std_org_role` | ✅ Supported | |
| `<std-org-abbrev>` | `NisoSts::StdOrgAbbrev` | ✅ Supported | |
| `<std-org-name>` | `NisoSts::StdOrgName` | ✅ Supported | |
| `<std-org-loc>` | `NisoSts::StdOrgLoc` | ✅ Supported | |
| `<std-org-group>` | `NisoSts::StdOrgGroup` | ✅ Supported | |

### Reference and Date Elements

| Element | sts-ruby Model | Status | Notes |
|---------|---------------|--------|-------|
| `<content-language>` | `MetadataStd#content_language` | ✅ Supported | |
| `<std-ref>` | `NisoSts::StandardRef` | ✅ Supported | With `@type` |
| `<doc-ref>` | `MetadataStd#doc_ref` | ✅ Supported | |
| `<release-date>` | `NisoSts::ReleaseDate` | ✅ Supported | With `@date-type`, `@iso-8601-date` |
| `<release-version>` | `NisoSts::ReleaseVersion` | ✅ Supported | |
| `<meta-date>` | `NisoSts::MetaDate` | ✅ Supported | With `@type` |
| `<pub-date>` | `MetadataStd#pub_date` | ✅ Supported | String type |
| `<comm-ref>` | `MetadataStd#comm_ref` | ✅ Supported | |
| `<secretariat>` | `MetadataStd#secretariat` | ✅ Supported | |
| `<ics>` | `MetadataStd#ics` | ✅ Supported | Collection in MetadataStd |
| `<page-count>` | `NisoSts::PageCount` | ✅ Supported | With `@count` |

### Cross-Reference and Other Metadata

| Element | sts-ruby Model | Status | Notes |
|---------|---------------|--------|-------|
| `<std-xref>` | `NisoSts::StdCrossReference` | ✅ Supported | With `@type` |
| `<self-uri>` | `NisoSts::SelfUri` | ✅ Supported | |
| `<custom-meta-group>` | `NisoSts::CustomMetaGroup` | ✅ Supported | |
| `<custom-meta>` | `NisoSts::CustomMeta` | ✅ Supported | |
| `<meta-name>` | In `CustomMeta` | ✅ Supported | |
| `<meta-value>` | In `CustomMeta` | ✅ Supported | |
| `<meta-note>` | `NisoSts::MetaNote` | ✅ Supported | |
| `<abstract>` | `NisoSts::Abstract` | ✅ Class exists | Not mapped in MetadataStd |

### Permissions (Section 4.2.2)

| Element | sts-ruby Model | Status | Notes |
|---------|---------------|--------|-------|
| `<permissions>` | `NisoSts::Permissions` | ✅ Supported | |
| `<copyright-statement>` | `Permissions#copyright_statement` (string) | ⚠️ Partial | Guidelines show this can contain `<inline-graphic>` and rich text, but modeled as plain string |
| `<copyright-year>` | `Permissions#copyright_year` (string) | ✅ Supported | |
| `<copyright-holder>` | `Permissions#copyright_holder` (string) | ⚠️ Partial | Guidelines show multiple `<copyright-holder>` elements allowed |
| `<license>` | Not in `NisoSts::Permissions` | ❌ Missing | IEC requires `<license>` with `<license-p>` inside permissions |
| `<license-p>` | Not in `NisoSts::Permissions` | ❌ Missing | License paragraphs |
| `<license_ref>` | Not in `NisoSts::Permissions` | ❌ Missing | Referenced in IEC metadata example |
| `<address>` in license | Not in permissions context | ❌ Missing | Guidelines show `<address>` inside `<license-p>` |

## Attribute Gaps

| Attribute | Parent Element | Guidelines Usage | Modeled | Status |
|-----------|---------------|-----------------|---------|--------|
| `@std-meta-type` | `<std-meta>` | Metadata type | ✅ Mapped | OK |
| `@date-type` | `<release-date>` | Date type (published, vote-start, vote-end) | ✅ Mapped | OK |
| `@type` | `<std-ref>` | "dated" or "undated" | ✅ Mapped | OK |
| `@count` | `<page-count>` | Page count value | ✅ Mapped | OK |
| `@type` | `<meta-date>` | Date type (vote-start, vote-end, stability-date) | ✅ Mapped | OK |
| `@type` | `<std-xref>` | Cross-reference type (revises, etc.) | ✅ Mapped | OK |

## MetadataStd vs MetadataIso Completeness

| Feature | In MetadataStd | In MetadataIso | Notes |
|---------|---------------|----------------|-------|
| Multiple `<title-wrap>` | ✅ Collection | ❌ Single only | Guidelines show multi-language title-wraps |
| Multiple `<std-ref>` | ✅ Collection | ❌ Single only | Both dated and undated refs needed |
| Multiple `<release-date>` | ✅ Collection | ❌ Single only | Multiple dates (published, vote-start, etc.) |
| Multiple `<std-org>` | ✅ Collection | ❌ Not present | |
| Multiple `<ics>` | ✅ Collection | ❌ Single only | Multiple ICS codes common |
| Multiple `<std-xref>` | ✅ Collection | ❌ Single only | |
| `<proj-id>` | ✅ Present | ❌ Missing | Project ID needed |
| `<release-version>` | ✅ Present | ❌ Missing | DIS/FIS/IS stage indicator |
| `<std-org-group>` | ✅ Present | ❌ Missing | |
| `<custom-meta-group>` | ✅ Collection | ❌ Single only | |
| `<meta-note>` | ✅ Collection | ❌ Not present | |
| `<abstract>` | ❌ Missing | ❌ Missing | Should be in both |
| Multiple `<permissions>` | ❌ Single only | ❌ Single only | IEC needs multiple permissions blocks |

## Key Gaps

- [ ] **`<license>` missing from `Permissions`**: IEC guidelines (Section 4.2.2) show `<license>` with `<license-p>` children, including `<address>` inside license paragraphs. `NisoSts::License` and `NisoSts::LicenseP` classes exist but are NOT mapped in `Permissions`.

- [ ] **`<copyright-statement>` modeled as plain string**: The IEC example shows `<copyright-statement>` containing `<inline-graphic>` and rich content. It should be a structured model, not a string.

- [ ] **`<copyright-holder>` should be collection**: Guidelines show multiple `<copyright-holder>` elements (Section 4.2.2 ISO example with ANFIA, FIEV, SMMT, VDA, etc.).

- [ ] **`MetadataIso` has limited collections**: `title_wrap`, `std_ref`, `release_date`, `ics`, `std_xref`, `custom_meta_group` are all single instead of collection. ISO legacy documents may have multiple values.

- [ ] **`<abstract>` not mapped in metadata**: The IEC metadata example (Section A.2) shows `<abstract>` inside `<std-meta>`. Neither `MetadataStd` nor `MetadataIso` maps it.

- [ ] **`<counts>` wrapper not modeled**: IEC metadata shows `<counts><page-count count="149"/></counts>`. Currently `page_count` is directly in metadata, missing the `<counts>` wrapper.

- [ ] **`<std-id-group>` inside `<std-ident>` only**: The IEC example shows `<std-id-group>` with `<std-id>` elements having `@originator` attribute. `StdId` does not have `@originator`.

- [ ] **`<comm-ref>` should be richer**: The IEC example shows `<comm-ref id="id_1215">TC 25</comm-ref>` with an `@id` attribute. Currently modeled as plain string.

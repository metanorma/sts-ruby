# Section A: Metadata Usage

## Overview
Covers the detailed metadata structures used by ISO (Section A.1), IEC (Section A.2), and National bodies (Section A.3), including specific elements and attributes shown in the complete metadata examples.

## ISO Metadata (Section A.1)

### `<std-meta>` Complete Element Set

| Element | In Guidelines Example | In MetadataStd | Status | Notes |
|---------|----------------------|---------------|--------|-------|
| `<title-wrap xml:lang="en">` | Multi-language titles | ✅ Collection | OK | |
| `<intro>` | Title intro | ✅ | OK | |
| `<main>` | Title main | ✅ | OK | |
| `<compl>` | Title complementary | ✅ | OK | |
| `<full>` | Title full | ✅ | OK | |
| `<proj-id>` | Project ID | ✅ | OK | |
| `<release-version>` | DIS/FIS/IS | ✅ | OK | |
| `<std-ident>` | Standard identification | ✅ | OK | |
| `<originator>` | ISO/IEC | ✅ | OK | |
| `<doc-type>` | IS, TR, TS, etc. | ✅ | OK | |
| `<doc-number>` | Document number | ✅ | OK | |
| `<part-number/>` | Part number (can be empty) | ✅ | OK | |
| `<edition>` | Edition number | ✅ | OK | |
| `<version>` | Version number | ✅ | OK | |
| `<std-org>` | Standards organization | ✅ | OK | |
| `@std-org-type` | sdo | ✅ | OK | |
| `<std-org-abbrev>` | ISO | ✅ | OK | |
| `<content-language>` | en | ✅ | OK | |
| `<std-ref type="dated">` | Dated reference | ✅ | OK | |
| `<std-ref type="undated">` | Undated reference | ✅ | OK | |
| `<doc-ref>` | ISO/DIS 16936-1(en) | ✅ | OK | |
| `<comm-ref>` | Committee reference | ✅ | OK | |
| `<secretariat>` | Secretariat | ✅ | OK | |
| `<ics>` | ICS code | ✅ | OK | |
| `<page-count count="8"/>` | Page count | ✅ | OK | |
| `<std-xref type="revises">` | Cross-reference | ✅ | OK | |
| `<permissions>` | Copyright | ✅ | OK | |
| `<copyright-statement>` | Copyright statement | ✅ (string) | OK | |
| `<copyright-year>` | Copyright year | ✅ | OK | |
| `<copyright-holder>` | Copyright holder | ✅ | OK | |
| `<self-uri>` | Self URI | ✅ | OK | |
| `<custom-meta-group>` | Custom metadata | ✅ | OK | |
| `<custom-meta>` | Custom metadata entry | ✅ | OK | |
| `<meta-name>` | Metadata key | ✅ | OK | |
| `<meta-value>` | Metadata value | ✅ | OK | |
| `<abstract>` | Abstract | ❌ Not in MetadataStd | Missing | ISO example does NOT show this, but IEC does |
| `<release-date>` | Release date | ✅ | OK | But ISO example does not show `@date-type` |

## IEC Metadata (Section A.2)

### IEC-Specific Elements in `<std-meta>`

| Element | In Guidelines Example | In MetadataStd | Status | Notes |
|---------|----------------------|---------------|--------|-------|
| `<permissions>` with `<license>` | License block | ⚠️ Permissions missing `<license>` | Missing | IEC requires full license text |
| `<inline-graphic/>` in copyright-statement | Copyright symbol | ❌ copyright-statement is string | Missing | Cannot contain inline-graphic |
| `<br/>` in copyright-statement | Line break | ❌ copyright-statement is string | Missing | |
| `<license>` | License block | ❌ Not in Permissions | Missing | |
| `<license-p>` | License paragraph | ❌ Not in Permissions | Missing | |
| `<address>` in `<license-p>` | Contact address | ❌ Not available | Missing | |
| `<addr-line>` in `<address>` | Address line | `NisoSts::AddrLine` exists | OK class but not in permissions context | |
| `<license_ref>` | License reference URL | ❌ Not in Permissions | Missing | |
| `<proj-id>` with namespace prefix | "iec:proj:19106" | ✅ | OK | |
| `<release-version>` | IS | ✅ | OK | |
| `<std-id-group>` inside `<std-ident>` | Group of IDs | ✅ | OK | |
| `<std-id>` with `@originator` | Originator attribute | ❌ Not on StdId | Missing | |
| `<isbn>` in `<std-ident>` | ISBN | ❌ Not in StandardIdentification | Missing | IEC shows `<isbn>9782832263464</isbn>` inside `<std-ident>` |
| `<suppl-type/>` | Supplement type | ❌ Not in StandardIdentification | Missing | |
| `<suppl-number/>` | Supplement number | ❌ Not in StandardIdentification | Missing | |
| `<std-org>` | Organization | ✅ | OK | |
| `<std-org-abbrev>` | IEC | ✅ | OK | |
| `<content-language>` | en | ✅ | OK | |
| `<release-date date-type="published">` | Release date with type | ✅ Has `@date-type` | OK | |
| `<meta-date type="stability-date">` | Meta date | ✅ Has `@type` | OK | |
| `<comm-ref>` with `@id` | Committee with ID | ❌ comm-ref is plain string | Missing | IEC: `<comm-ref id="id_1215">TC 25</comm-ref>` |
| Multiple `<ics>` | Multiple ICS codes | ✅ Collection | OK | |
| `<counts>` | Counts wrapper | ❌ Not modeled | Missing | IEC: `<counts><page-count count="149"/></counts>` |
| `<self-uri xlink:type="simple">` | Self URI with xlink type | ✅ Has SelfUri | OK | |
| `<abstract xml:lang="en">` | Abstract | ❌ Not in MetadataStd | Missing | |
| `<custom-meta-group>` | Custom metadata | ✅ | OK | |

## National Metadata (Section A.3)

The guidelines mention national metadata can use multiple `<std-meta>` instances. The `NatMeta` class exists and has similar structure to `RegMeta`.

| Feature | In NatMeta | Status | Notes |
|---------|-----------|--------|-------|
| `<title-wrap>` | ✅ Collection | OK | |
| `<std-ident>` | ✅ | OK | |
| `<permissions>` | ✅ | OK | |
| `<custom-meta-group>` | ✅ Collection | OK | |
| `@id` on nat-meta | ❌ Not mapped | Missing | |

## Key Gaps

- [ ] **`<license>` block missing from `Permissions`**: The IEC metadata example (Section A.2) shows a full license block with `<license>`, `<license-p>`, `<address>`, `<addr-line>`, and `<license_ref>`. The `License` and `LicenseP` classes exist but are NOT wired into the `Permissions` model.

- [ ] **`<copyright-statement>` needs rich content**: Currently modeled as plain string. IEC example shows it containing `<inline-graphic/>`, `<br/>`, and mixed text. Needs to be a structured element.

- [ ] **`<copyright-holder>` should be collection**: ISO example shows multiple `<copyright-holder>` elements in a single `<permissions>` block.

- [ ] **`<isbn>` missing from `StandardIdentification`**: IEC example shows `<isbn>` inside `<std-ident>`.

- [ ] **`<suppl-type>`, `<suppl-number>` missing from `StandardIdentification`**: IEC shows these empty elements inside `<std-ident>`.

- [ ] **`<counts>` wrapper not modeled**: IEC uses `<counts><page-count/></counts>` instead of bare `<page-count>`. Neither `MetadataStd` nor `MetadataIso` maps `<counts>`.

- [ ] **`<abstract>` not in metadata models**: IEC shows `<abstract xml:lang="en"><p>...</p></abstract>` inside `<std-meta>`.

- [ ] **`<comm-ref>` should support `@id`**: IEC: `<comm-ref id="id_1215">TC 25</comm-ref>`. Currently plain string.

- [ ] **`@originator` missing from `StdId`**: IEC: `<std-id originator="IEC" std-id-link-type="id" std-id-type="dated">`.

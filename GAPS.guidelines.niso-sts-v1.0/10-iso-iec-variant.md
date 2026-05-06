# Section 10: ISO-IEC Variant and Amendments

## Overview
Covers the ISO/IEC-specific features: IEC amendments with `<editing-instruction>`, ISO amendments, IEC Corrigenda, IEC Interpretation Sheets (ISH), IEC Software supplements, and the ID schemes for both IEC and ISO.

## ISO vs IEC Variant Support

### Structural Differences

| Feature | ISO Variant | IEC Variant | sts-ruby Support | Notes |
|---------|------------|-------------|-----------------|-------|
| Root element | `<standard>` | `<standard>` | ✅ Both | NisoSts and IsoSts variants |
| Metadata element | `<iso-meta>` (legacy), `<std-meta>` | `<std-meta>` | ✅ Both | |
| ID separator | Underscore (`sec_1`) | Dash (`sec-1`) | ✅ Values in `@id` | IDs are free-form strings |
| `<annex-type>` | Text: "(informative)" | Not rendered (from `@content-type`) | ✅ Both approaches | |
| `@content-type` on `<app>` | "inform-annex" / "normative-annex" | "inform" / "norm" (legacy), "informative" / "normative" (future) | ✅ Mapped | |
| `<bold>` in table headers | Yes | No (auto-bold, use `<roman>` for plain) | ✅ Both elements exist | |
| Footnote placement | At point of use | `<fn-group>` in `<back>` (legacy) | ✅ Both approaches | |
| Amendment style | Separate text, no semantic instructions | `<editing-instruction>` with types | ⚠️ Partial | EditingInstruction model incomplete |
| Formula groups | Not used | Used (IEC) | ✅ DispFormulaGroup exists | |

### ID Schemes

#### ISO ID Scheme (from guidelines Annex)

| Element | Pattern | sts-ruby Support | Notes |
|---------|---------|-----------------|-------|
| Section: `sec_1`, `sec_1.2.1` | `sec_{number}` | ✅ String IDs | Free-form string attribute |
| Foreword: `sec_foreword` | `sec_foreword` | ✅ | |
| Introduction: `sec_intro` | `sec_intro` | ✅ | |
| Bibliography: `sec_bibl` | `sec_bibl` | ✅ | |
| Annex: `sec_A`, `sec_B.1` | `sec_{letter}` | ✅ | |
| Bibliography ref: `biblref_1` | `biblref_{label}` | ✅ | |
| Term: `term_3.1` | `term_{number}` | ✅ | |
| Table: `tab_1` | `tab_{number}` | ✅ | |
| Figure: `fig_1` | `fig_{number}` | ✅ | |
| Formula: `formula_1` | `formula_{number}` | ✅ | |
| Footnote: `fn_1` | `fn_{number}` | ✅ | |
| Table footnote: `table-fn_1.1` | `table-fn_{table}.{n}` | ✅ | |

#### IEC ID Scheme

| Element | Pattern | sts-ruby Support | Notes |
|---------|---------|-----------------|-------|
| Section: `sec-1` | `sec-{number}` | ✅ String IDs | |
| Foreword: `sec-foreword` | `sec-foreword` | ✅ | |
| Introduction: `sec-introduction` | `sec-introduction` | ✅ | |
| Bibliography: `sec-bibliography` | `sec-bibliography` | ✅ | |
| Index: `sec-index` | `sec-index` | ✅ | |
| Annex: `anx-A` | `anx-{letter}` | ✅ | |
| Bibliography ref: `bib-1` | `bib-{label or seq}` | ✅ | |
| Concept: `con-3.2.1` | `con-{number}` | ✅ | |
| Term entry: `te-3.2.1` | `te-{number}` | ✅ | |
| Term: `ter-broadcast` | `ter-{term_text}` | ✅ | |
| Note to entry: `nte-3.4-1` | `nte-{section}-{seq}` | ✅ | |
| Table: `tab-1` | `tab-{number}` | ✅ | |
| Informal table: `tab-informal-5.3-1` | `tab-informal-{section}-{seq}` | ✅ | |
| Figure: `fig-1` | `fig-{number}` | ✅ | |
| Formula: `for-1` | `for-{number}` | ✅ | |
| Formula (unnumbered): `for-informal-5.6-1` | `for-informal-{section}-{seq}` | ✅ | |
| Formula group: `forg-informal-5.3.1-1` | `forg-informal-{section}-{seq}` | ✅ | |
| Math: `mml-1` | `mml-{seq}` | ✅ | |
| Footnote: `foo-1` | `foo-{number}` | ✅ | |
| Symbol footnote: `fos-1` | `fos-{seq}` | ✅ | |
| Table footnote: `tfn-1-1` | `tfn-{table}-{seq}` | ✅ | |
| Symbol table fn: `tfs-4-1` | `tfs-{table}-{seq}` | ✅ | |
| Figure note: `fno-4-1` | `fno-{figure}-{seq}` | ✅ | |
| Table note: `tno-4-1` | `tno-{table}-{seq}` | ✅ | |
| List item: `lis-5.6-L1-2` | `lis-{sec}-L{list}-{item}` | ✅ | |
| Note: `not-3.5-1` | `not-{sec}-{seq}` | ✅ | |
| Paragraph: `p-450` | `p-{seq}` | ✅ | |

## IEC Amendments (Annex C)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<editing-instruction>` | Amendment instructions | `NisoSts::EditingInstruction` | ⚠️ Partial | Missing `@content-type` and `<p>` child |
| `@content-type="addition"` | Addition instruction | ❌ Not mapped | Missing | |
| `@content-type="replacement"` | Replacement instruction | ❌ Not mapped | Missing | |
| `@content-type="deletion"` | Deletion instruction | ❌ Not mapped | Missing | |
| `@content-type="modification"` | Modification instruction | ❌ Not mapped | Missing | |
| `<p>` inside editing-instruction | Instruction text (e.g. "Addition:", "Replace:") | ❌ Not mapped | Missing | Guidelines show `<p><italic>Addition:</italic></p>` |
| `<italic>` inside editing-instruction `<p>` | Formatting | ❌ Not applicable | Missing because `<p>` not in model | |
| `<std>` inside editing-instruction | Standard references | ❌ Not applicable | Missing | |
| `<term-sec>` after editing-instruction | New terms in amendment | ✅ In parent section | OK | |

## ISO Amendments

| Feature | Guidelines Usage | sts-ruby Support | Status | Notes |
|---------|-----------------|-----------------|--------|-------|
| Separate document text | No semantic markup | ✅ Sections handle plain text | OK | |
| TBX terms in amendments | `<term-sec>` with `<tbx:termEntry>` | ✅ | OK | |

## IEC Corrigenda

| Feature | Guidelines Usage | sts-ruby Support | Status |
|---------|-----------------|-----------------|--------|
| Integrated into base publication | Content updated inline | N/A | Not a separate XML structure |

## IEC Interpretation Sheets (ISH)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<supplementary-material>` | Link to ISH PDF | `NisoSts::SupplementaryMaterial` | ✅ Class exists | With `@xlink:href` |
| `<supplementary-material>` in `<p>` (foreword) | Mentioning ISH inclusion | ❌ Not in Paragraph | Missing | Paragraph does not map `<supplementary-material>` |

## IEC Software Supplements

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<supplementary-material xlink:href="asset/...">` | Link to supplement files | ✅ Class exists | OK | |
| `<supplementary-material>` in `<p>` | In foreword text | ❌ Not in Paragraph | Missing | Same as ISH above |

## Key Gaps

- [ ] **`EditingInstruction` is critically incomplete for IEC amendments**: Missing `@content-type` (values: addition, replacement, deletion, modification) and `<p>` child element. IEC amendments rely entirely on this element.

- [ ] **`<supplementary-material>` not available in `<p>`**: Both IEC ISH and Software supplements need `<supplementary-material>` inside `<p>` in the foreword. `Paragraph` model does not include this element.

- [ ] **`Graphic` missing `id`, `label`, `caption` children for ISO sub-figures**: ISO uses `<graphic id="fig_1.1"><label>a)</label><caption><title>...</title></caption></graphic>` for sub-figure captions. The `Graphic` model only has `@xlink:href` and `<object-id>`.

- [ ] **IEC legacy `<tfoot>` not fully supported**: Legacy IEC tables may use `<tfoot>` element inside `<table>`. `TbxIsoTml::Table` does map `<tfoot>`, so this is OK.

- [ ] **No explicit support for amendment metadata**: Amendments have their own metadata structure (referencing the base publication). No specific amendment metadata model exists beyond standard `<std-meta>`.

- [ ] **`TableWrapFoot` missing legacy `<tr>/<td>` children**: Legacy IEC uses `<tr><td>` directly inside `<table-wrap-foot>`, not currently supported.

## Summary: ISO-IEC Variant Priority Gaps

Priority items for ISO-IEC variant support:

1. **HIGH**: `EditingInstruction` completion (`@content-type`, `<p>` child) -- critical for IEC amendments
2. **HIGH**: `<supplementary-material>` in `<p>` -- needed for IEC ISH and software supplements
3. **HIGH**: `<code>` element -- needed for technical standards content
4. **MEDIUM**: `@list-content` on `DefList` -- needed for formula keys, figure keys, abbreviation lists
5. **MEDIUM**: `Permissions` completion (`<license>`, rich `<copyright-statement>`) -- needed for IEC metadata
6. **MEDIUM**: `Graphic` sub-figure support (ISO) -- `id`, `label`, `caption` children
7. **MEDIUM**: `<index>` element hierarchy -- needed for back matter
8. **LOW**: MathML element coverage -- partial coverage exists, complex formulae may not round-trip
9. **LOW**: `<std-doc-meta>` wiring into `Front` -- used in adoption documents
10. **LOW**: `TermDisplay` completion -- IEC fallback for certain document types

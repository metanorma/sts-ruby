# Section 9: Terms and Definitions

## Overview
Covers terminological entries using TBX (ISO standard) and `<term-display>` (IEC fallback), including `<term-sec>`, `<tbx:termEntry>`, `<tbx:langSet>`, `<tbx:tig>`, `<tbx:term>`, `<tbx:definition>`, `<tbx:note>`, `<tbx:example>`, `<tbx:source>`, `<tbx:entailedTerm>`, `<tbx:see>`, `<tbx:subjectField>`, and `<term-display>`.

## Element Coverage

### Terminological Entry Container

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<term-sec>` | Terminological entry section | `NisoSts::TermSection`, `IsoSts::TermSec` | ✅ Supported | |
| `@id` on `<term-sec>` | Entry ID (sec_3.1 / con-3.1.3) | ✅ Mapped | OK | |
| `<label>` in `<term-sec>` | Entry number | ✅ Mapped | OK | |
| `<tbx:termEntry>` | TBX term entry | `TbxIsoTml::TermEntry` | ✅ Supported | With `@id` |
| `<term-display>` | Appearance-oriented entry | `NisoSts::TermDisplay` | ✅ Supported | IEC fallback |

### TBX langSet

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<tbx:langSet>` | Language set | `TbxIsoTml::LangSet` | ✅ Supported | |
| `@xml:lang` on `<tbx:langSet>` | Language | ✅ Mapped (`lang`) | OK | |

### TBX Definition

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<tbx:definition>` | Term definition | `TbxIsoTml::Definition` | ✅ Supported | |
| `<break/>` in definition | Line break in definition | ⚠️ Needs verification | Definition uses mixed content? | |

### TBX Term Information Group

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<tbx:tig>` | Term information group | `TbxIsoTml::TermInformationGroup` | ✅ Supported | |
| `@id` on `<tbx:tig>` | TIG identifier | ✅ Mapped | OK | |
| `<tbx:term>` | Term text | `TbxIsoTml::Term` | ✅ Supported | |
| `@id` on `<tbx:term>` | Term ID (IEC: ter-sound_pressurep) | ⚠️ Check | Term class exists | |
| `<tbx:partOfSpeech>` | Part of speech | `TbxIsoTml::PartOfSpeech` | ✅ Supported | With `@value` (noun, verb, adj, adv) |
| `<tbx:normativeAuthorization>` | Term status | `TbxIsoTml::NormativeAuthorization` | ✅ Supported | With `@value` (preferredTerm, admittedTerm, deprecatedTerm) |
| `<tbx:termType>` | Term type | `TbxIsoTml::TermType` | ✅ Supported | With `@value` (acronym, abbreviation, fullForm, symbol, formula, equation) |
| `<tbx:grammaticalNumber>` | Grammatical number | `TbxIsoTml::GrammaticalNumber` | ✅ Supported | |
| `<tbx:grammaticalGender>` | Grammatical gender | `TbxIsoTml::GrammaticalGender` | ✅ Supported | |

### TBX Notes and Examples

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<tbx:note>` | Notes on terms | `TbxIsoTml::Note` | ✅ Supported | With `@id` |
| `<tbx:example>` | Examples | `TbxIsoTml::Example` | ✅ Supported | |

### TBX Cross-References

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<tbx:entailedTerm>` | Cross-ref between terms | `TbxIsoTml::EntailedTerm` | ✅ Supported | With `@target` |
| `@target` | Internal reference | ✅ Mapped | OK | |
| `@xtarget` | External reference | ⚠️ Check | May not be mapped | Guidelines mention `@xtarget` for external term refs |
| `<tbx:see>` | Reference to other clauses | `TbxIsoTml::See` | ✅ Supported | With `@target` |
| `<tbx:crossReference>` | Cross reference | `TbxIsoTml::CrossReference` | ✅ Supported | |

### TBX Source and Subject

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<tbx:source>` | Source of definition | `TbxIsoTml::Source` | ✅ Supported | |
| `<tbx:subjectField>` | Subject field | `TbxIsoTml::SubjectField` | ✅ Supported | |

### term-display (IEC, Section 9.4)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<term-display>` | Appearance-oriented entry | `NisoSts::TermDisplay` | ✅ Supported | |
| `<p>` in term-display | Entry text | ✅ Mapped | OK | |
| `<term>` in term-display | Term | ✅ Via `NisoSts::Term` | OK | But check if `term-display` maps `<term>` -- currently only maps `<p>` and `<non-normative-note>` |
| `<def>` in term-display | Definition | ❌ Not mapped | Missing | Guidelines show `<def>` inside `<term-display>` |
| `<list>` in term-display | Lists in definitions | ❌ Not mapped | Missing | |
| `<xref>` in term-display | Cross-references | ❌ Not mapped | Missing | |

## Attribute Gaps

| Attribute | Parent Element | Guidelines Usage | Modeled | Status |
|-----------|---------------|-----------------|---------|--------|
| `@id` on `<tbx:note>` | Note ID (nte-3.1.3-1) | ✅ Mapped | OK | |
| `@id` on `<tbx:term>` | Term ID (IEC: ter-rated_capacity) | ⚠️ Check | Need to verify `Term` has `@id` | |
| `@value` on `<tbx:partOfSpeech>` | noun, verb, adj, adv | ✅ Mapped | OK | |
| `@value` on `<tbx:normativeAuthorization>` | preferredTerm, admittedTerm, deprecatedTerm | ✅ Mapped | OK | |
| `@value` on `<tbx:termType>` | acronym, abbreviation, fullForm, symbol, formula, equation | ✅ Mapped | OK | |
| `@target` on `<tbx:entailedTerm>` | Internal term ref | ✅ Mapped | OK | |
| `@xtarget` on `<tbx:entailedTerm>` | External term ref | ⚠️ Check | May not be mapped | |
| `@target` on `<tbx:see>` | See target | ✅ Mapped | OK | |

## TermDisplay Content Gaps

The `TermDisplay` model is severely limited. Guidelines Section 9.4 shows rich content:

| Element | In Guidelines `<term-display>` | In TermDisplay model | Status |
|---------|-------------------------------|---------------------|--------|
| `<p>` | Paragraph text | ✅ | OK |
| `<non-normative-note>` | Notes | ✅ | OK |
| `<term>` | Term text with `@id` | ❌ Not mapped | Missing |
| `<def>` | Definition with `<p>` children | ❌ Not mapped | Missing |
| `<list>` | Lists in definition | ❌ Not mapped | Missing |
| `<xref>` | Cross-references | ❌ Not mapped | Missing |
| `<label>` | Labels | ❌ Not mapped | Missing |
| `<styled-content>` | Styled content | ❌ Not mapped | Missing |
| `<italic>` | Italic text | ❌ Not mapped | Missing |
| `<fig>` | Figure references | ❌ Not mapped | Missing |

## Key Gaps

- [ ] **`TermDisplay` is severely incomplete**: Only has `<p>` and `<non-normative-note>`. Missing `<term>`, `<def>`, `<list>`, `<xref>`, `<label>`, `<styled-content>`, `<italic>`, `<fig>`. IEC documents that use `<term-display>` (amendments, special series) will lose content.

- [ ] **`<def>` not in `TermDisplay`**: The guidelines (Section 9.4) clearly show `<def><p>...</p></def>` inside `<term-display>`.

- [ ] **`<term>` not in `TermDisplay`**: Guidelines show `<term id="ter-normal_load">normal load</term>` inside `<term-display>`.

- [ ] **`@xtarget` on `EntailedTerm`**: Guidelines mention `@xtarget` for cross-references to terms external to the document. Need to verify this is mapped.

- [ ] **`<std>` inside `<tbx:source>`**: Guidelines show `<tbx:source>SOURCE: <std>...</std></tbx:source>`. Need to verify that the `Source` model supports inline `<std>` elements.

- [ ] **`<tbx:geographicalUsage>` and `<tbx:grammaticalGender>`**: Guidelines note these "will probably be used in the future". Currently modeled (both classes exist), which is good preparation.

- [ ] **`<tbx:pronunciation>`**: Not mentioned heavily in guidelines but exists in `TermInformationGroup`. Acceptable as prepared for future use.

- [ ] **`Section` missing `<term-sec>` children in `IsoSts::Sec`**: `IsoSts::Sec` does have `term_sec` mapped, so this is OK.

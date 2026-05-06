# Section 9: Terms and Definitions

## Overview
Section 9 covers terminological entries using TBX (Term Base eXchange), including term entries, definitions, term information groups, examples, notes, cross-references, sources, and subject fields.

## Element Coverage

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<term-sec>` | Terminological entry container | `NisoSts::TermSection` | Supported | Has `@id`, `@sec-type`, `<label>`, `<termEntry>`, `<term-display>` |
| `<tbx:termEntry>` | TBX term entry | `TbxIsoTml::TermEntry` | Supported | Has `@id`, `<langSet>` |
| `<tbx:langSet>` | Language set | `TbxIsoTml::LangSet` | Supported | Has `@xml:lang`, `<definition>`, `<note>`, `<example>`, `<tig>`, `<source>`, `<subjectField>`, `<see>` |
| `<tbx:definition>` | Term definition | `TbxIsoTml::Definition` | Supported | Mixed content with `<entailedTerm>`, `<italic>`, `<sub>`, `<sup>`, `<list>`, `<std>` |
| `<tbx:tig>` | Term information group | `TbxIsoTml::TermInformationGroup` | Supported | Has `<term>`, `<partOfSpeech>`, `<normativeAuthorization>`, `<termType>`, `<grammaticalNumber>` |
| `<tbx:term>` | Term text | `TbxIsoTml::Term` | Supported | Has `@id`, mixed content with `<italic>`, `<bold>`, `<sub>`, `<sup>` |
| `<tbx:partOfSpeech>` | Part of speech | `TbxIsoTml::PartOfSpeech` | Supported | `@value`: noun, verb, adj, adv |
| `<tbx:normativeAuthorization>` | Term status | `TbxIsoTml::NormativeAuthorization` | Supported | `@value`: preferredTerm, admittedTerm, deprecatedTerm |
| `<tbx:termType>` | Term type | `TbxIsoTml::TermType` | Supported | `@value`: fullForm, abbreviation, symbol, formula, etc. |
| `<tbx:grammaticalNumber>` | Singular/plural | `TbxIsoTml::GrammaticalNumber` | Supported | `@value`: singular, plural |
| `<tbx:grammaticalGender>` | Gender | `TbxIsoTml::GrammaticalGender` | Supported | `@value`: masculine, feminine, neuter |
| `<tbx:geographicalUsage>` | Geographic usage | `TbxIsoTml::GeographicalUsage` | Supported | Content-based |
| `<tbx:pronunciation>` | Pronunciation | `TbxIsoTml::Pronunciation` | Supported | Content-based |
| `<tbx:note>` | Notes in terminology | `TbxIsoTml::Note` | Supported | Has `@id`, `<entailedTerm>`, `<xref>`, `<list>` |
| `<tbx:example>` | Examples in terminology | `TbxIsoTml::Example` | Supported | Has `@id`, `<entailedTerm>`, `<italic>` |
| `<tbx:entailedTerm>` | Cross-ref to other terms | `TbxIsoTml::EntailedTerm` | Supported | Has `@target`, content text |
| `<tbx:source>` | Source of term | `TbxIsoTml::Source` | Partial | Missing `<std>` child -- IEC codes `<std>` references inside source (Sec B.2.17) |
| `<tbx:subjectField>` | Subject field | `TbxIsoTml::SubjectField` | Supported | Content-based |
| `<tbx:see>` | Cross-reference from terms | `TbxIsoTml::See` | Supported | Has `@script`, content |
| `<term-display>` | Display-oriented terms (IEC) | `NisoSts::TermDisplay` | Partial | Missing `<term>` child, `<def>` child, `<list>` child -- guidelines show full display entries (Sec B.3.3) |
| `<label>` | Entry number | `NisoSts::Label` | Supported | |
| `<xref>` | Cross-references to terms | `TbxIsoTml::Xref` | Partial | Missing `@custom-type` attribute |

## Attribute Gaps

| Attribute | Parent Element | Guidelines Usage | Modeled | Status |
|-----------|---------------|-----------------|---------|--------|
| `@xml:lang` | `<tbx:langSet>` | Language of the term entry | Yes | Supported |
| `@id` | `<tbx:termEntry>` | Term entry ID | Yes | Supported |
| `@id` | `<tbx:term>` | Term ID | Yes | Supported |
| `@value` | `<tbx:partOfSpeech>` | "noun", "verb", "adj", "adv" | Yes | Supported |
| `@value` | `<tbx:normativeAuthorization>` | "preferredTerm", "admittedTerm", "deprecatedTerm" | Yes | Supported |
| `@value` | `<tbx:termType>` | "fullForm", "abbreviation", "symbol", "formula" | Yes | Supported |
| `@target` | `<tbx:entailedTerm>` | ID of referenced entry | Yes | Supported |
| `@target` | `<tbx:see>` | ID of referenced element (legacy) | No | Missing `@target` on `See` |
| `@ref-type` | `<xref>` | "custom" for term cross-refs | Yes | Supported |
| `@custom-type` | `<xref>` | "term-entry" for cross-refs to terms | No | Missing on `Xref` |
| `@rid` | `<xref>` | Target element ID | Yes | Supported |

## Key Gaps
- [ ] `TbxIsoTml::Source` missing `<std>` child element -- IEC codes standards references inside `<tbx:source>` (Sec B.2.17, Sec 9.2.8)
- [ ] `NisoSts::TermDisplay` is incomplete -- missing `<term>`, `<def>`, `<list>` children needed for IEC legacy term display (Sec B.3.3)
- [ ] `TbxIsoTml::See` missing `@target` attribute -- legacy `<tbx:see>` uses `@target` for cross-references (Sec B.2.18)
- [ ] `TbxIsoTml::Xref` missing `@custom-type` attribute -- guidelines specify `@custom-type="term-entry"` for cross-refs to terms from outside the terminology section (Sec 9.2.6)
- [ ] `TbxIsoTml::LangSet` missing `<xref>` child -- Sec 9.2.7 says `<xref>` is used for references from terms to other document sections (replaces `<tbx:see>`)
- [ ] `TbxIsoTml::Note` missing text content mapping -- TBX notes contain text directly, but model maps children only
- [ ] `TbxIsoTml::Example` missing `<break>` child -- may need line breaks in examples

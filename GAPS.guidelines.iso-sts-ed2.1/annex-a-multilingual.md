# Annex A: Multilingual Contents, Translations and Adoptions

## Overview
Annex A covers the structuring and tagging of multilingual documents, translations, and adoptions of IEC/ISO standards. It specifies the `<adoption>` element structure, metadata handling for derived versions, `@xml:lang` usage on block elements, and TBX terminology considerations during translation.

## Element Coverage

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<adoption>` | Container for adopted standard | `NisoSts::Adoption` | Partial | Has `@id`, `@xml:lang`, `<adoption-front>`, `<back>`, nested `<adoption>`, `<standard>`; missing `<processing-meta>` guidance |
| `<adoption-front>` | Adoption metadata front matter | `NisoSts::AdoptionFront` | Partial | Inherits from `Front`; maps `iso-meta`, `std-meta`, `sec`; missing `<std-doc-meta>` child |
| `<standard>` | Original standard inside adoption | `NisoSts::Standard` | Partial | Has `@id`, `@xml:lang`, `<front>`, `<body>`, `<back>`; missing `<processing-meta>` child |
| `<front>` | Standard front matter | `NisoSts::Front` | Partial | Maps `iso-meta`, `std-meta`, `sec`; missing `<std-doc-meta>` child |
| `<std-doc-meta>` | Metadata valid for entire document | `NisoSts::StdDocMeta` | Modeled (not mapped) | Class exists but not mapped in `Front` or `AdoptionFront` |
| `<std-meta>` | Metadata for derived version | `NisoSts::MetadataStd` | Partial | Has `@id`, `@std-meta-type`, extensive metadata children; missing `<abstract>`, `<isbn>`, `<counts>`, `<suppl-type/number/version>`, multiple `<permissions>` |
| `<iso-meta>` | ISO-specific metadata | `NisoSts::MetadataIso` | Partial | Has standard metadata children; guidelines recommend avoiding `<iso-meta>` in favor of `<std-meta>` |
| `<processing-meta>` | Table model, TBX model, MathML version | Missing | Missing | **Critical gap** -- contains `@tagset`, `@tbx-tagset`, `@mathml-version`; recommended to keep identical between original and adoption |

## Attribute Gaps

| Attribute | Parent Element | Guidelines Usage | Modeled | Status |
|-----------|---------------|-----------------|---------|--------|
| `@xml:lang` | `<adoption>` | Language of adopted content | Yes | Supported |
| `@xml:lang` | `<standard>` | Language of original standard | Yes | Supported |
| `@xml:lang` | `<sec>` | Language override for multilingual sections | No | **Missing** -- guidelines say `@xml:lang` should be on "most outer block level element" for multilingual documents |
| `@xml:lang` | `<body>` | Language override for body content | No | Missing |
| `@xml:lang` | `<back>` | Language override for back matter | No | Missing |
| `@xml:lang` | `<p>` | Language override for paragraphs | No | Missing |
| `@xml:lang` | `<list>` | Language override for lists | No | Missing |
| `@xml:lang` | `<fig>` | Language override for figures | No | Missing |
| `@xml:lang` | `<fig-group>` | Language override for figure groups | No | Missing |
| `@xml:lang` | `<term-sec>` | Language override for term sections | No | Missing |
| `@xml:lang` | `<disp-formula>` | Language override for formulae | No | Missing |
| `@xml:lang` | `<tbx:langSet>` | Language of terminology set | Yes | Supported -- has `@xml:lang` as `lang` attribute |
| `@id` | `<adoption>` | Adoption identifier | Yes | Supported |
| `@id` | `<standard>` | Standard identifier | Yes | Supported |

## TBX Terminology Translation Considerations (A.3.2)

The guidelines identify TBX elements that may require modification during translation:

| Element | Translation Concern | sts-ruby Model | Status |
|---------|---------------------|---------------|--------|
| `<tbx:langSet>` | `@xml:lang` adapted to translation language | `TbxIsoTml::LangSet` | Supported -- `@xml:lang` modeled |
| `<tbx:grammaticalNumber>` | May need adaptation to target language | `TbxIsoTml::GrammaticalNumber` | Supported |
| `<tbx:geographicalUsage>` | May need to be added for target language | `TbxIsoTml::GeographicalUsage` | Supported |
| `<tbx:grammaticalGender>` | May need to be added for translation | `TbxIsoTml::GrammaticalGender` | Supported |
| `<tbx:example>` | May need adaptation for translation users | `TbxIsoTml::Example` | Supported |
| `<tbx:partOfSpeech>` | Usually identical but may need adaptation | `TbxIsoTml::PartOfSpeech` | Supported |
| `<tbx:pronunciation>` | May need to be added for translation | `TbxIsoTml::Pronunciation` | Supported |
| `<tbx:source>` | May need adaptation or removal | `TbxIsoTml::Source` | Partial -- missing `<std>` child |
| `<label>` | Preserve original numbering in translation | `NisoSts::Label` | Supported |
| `<tbx:termEntry>` | Preserve entry structure and IDs | `TbxIsoTml::TermEntry` | Supported |

## Metadata Preservation Rules (A.3.1)

| Rule | sts-ruby Support | Notes |
|------|-----------------|-------|
| Original metadata preserved in `<standard>` | Yes | `Standard` has `Front` with `iso-meta`/`std-meta` |
| Adopting org metadata in `<adoption-front>` `<std-meta>` | Partial | `AdoptionFront` maps `std-meta` but missing `<std-doc-meta>` |
| `<std-doc-meta>` for document-wide metadata | No (class exists, not wired) | `StdDocMeta` class exists but not referenced from `Front` or `AdoptionFront` |
| `<processing-meta>` kept identical | No | `<processing-meta>` element not modeled at all |
| Avoid `<iso-meta>`, `<reg-meta>`, `<nat-meta>` | N/A | Guidelines say avoid these; models exist for `iso-meta` only |
| Preserve original IDs | Yes | Elements have `@id` attributes |
| Preserve element tags for identical content | Yes | Round-trip fidelity supported by lutaml-model |

## Key Gaps

- [ ] **CRITICAL**: `<processing-meta>` element not modeled -- recommended to keep identical between original standard and adoption; contains `@tagset`, `@tbx-tagset`, `@mathml-version` attributes (Sec A.3.1)
- [ ] **CRITICAL**: `NisoSts::Front` and `NisoSts::AdoptionFront` missing `<std-doc-meta>` child -- guidelines say `<std-doc-meta>` contains "metadata valid for the entire document" during adoptions (Sec A.3.1)
- [ ] **CRITICAL**: `NisoSts::AdoptionFront` inherits from `Front` but only maps `iso-meta`, `std-meta`, `sec` -- missing `<std-doc-meta>` mapping needed for adoption metadata layering
- [ ] **IMPORTANT**: Key block-level elements missing `@xml:lang` attribute -- multilingual documents need `@xml:lang` on `<sec>`, `<body>`, `<back>`, `<p>`, `<list>`, `<fig>`, `<fig-group>`, `<term-sec>`, `<disp-formula>` to mark language-specific content (Sec A.3.1)
- [ ] `NisoSts::Section` missing `@xml:lang` attribute -- most critical for multilingual documents where "it is sufficient to provide the @xml:lang on the top level `<sec>` element only" (Sec A.3.1)
- [ ] `NisoSts::Body` missing `@xml:lang` attribute -- needed for language override at body level
- [ ] `NisoSts::Paragraph` missing `@xml:lang` attribute -- needed for inline language switching
- [ ] `NisoSts::List` missing `@xml:lang` attribute -- needed for language-specific lists
- [ ] `NisoSts::Figure` and `NisoSts::FigGroup` missing `@xml:lang` attribute -- needed for multilingual figure captions
- [ ] `NisoSts::TermSection` missing `@xml:lang` attribute -- needed for terminology in different languages
- [ ] `NisoSts::DisplayFormula` missing `@xml:lang` attribute -- needed for multilingual formula notes

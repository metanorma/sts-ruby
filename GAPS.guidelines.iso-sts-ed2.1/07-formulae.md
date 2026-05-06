# Section 7: Formulae and Equations

## Overview
Section 7 covers display formulae, inline formulae, formula numbering, notes to formulae, formula keys (using `<legend>`), and MathML.

## Element Coverage

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<disp-formula>` | Block formulae | `NisoSts::DisplayFormula` | Partial | Missing `<legend>`, `<non-normative-note>`, `<def-list>` children |
| `<inline-formula>` | Inline formulae | `NisoSts::InlineFormula` | Supported | Has `@id`, `<math>`, `<alternatives>` |
| `<mml:math>` | MathML expression | `TbxIsoTml::Math` | Partial | Limited MathML element support |
| `<label>` | Formula number e.g. "(1)" | `NisoSts::Label` | Supported | |
| `<legend>` | Formula key container (new) | Missing | Missing | **Critical gap** -- introduced for formula keys in Ed 2.1 OSD |
| `<def-list>` | Formula key definition list | `NisoSts::DefList` | Supported | Has `@list-content` (note: model has `@list-type` not `@list-content`) |
| `<def-item>` | Key term/definition pair | `NisoSts::DefItem` | Partial | Missing `@id` attribute |
| `<term>` | Key variable symbol | `NisoSts::Term` | Supported | |
| `<def>` | Key variable definition | `NisoSts::Def` | Supported | |
| `<non-normative-note>` | Notes to formulae | `NisoSts::NonNormativeNote` | Supported | Not mapped as child of `DisplayFormula` |
| `<tex-math>` | TeX math representation | `NisoSts::TexMath` | Supported | |
| `<graphic>` | Formula graphic | `NisoSts::Graphic` | Supported | |

## Attribute Gaps

| Attribute | Parent Element | Guidelines Usage | Modeled | Status |
|-----------|---------------|-----------------|---------|--------|
| `@id` | `<disp-formula>` | Formula identifier | Yes | Supported |
| `@content-type` | `<disp-formula>` | Formula content type | Yes | Supported |
| `@display` | `<mml:math>` | "block" for display formulae | Yes | Supported |
| `@id` | `<mml:math>` | Math element ID (e.g. "mml_m5") | Yes | Supported |
| `@list-content` | `<def-list>` | "formula" for formula keys | No | Model has `@list-type` not `@list-content`; guidelines use `@list-content` |
| `@id` | `<def-item>` | Item identifier | No | Missing |

## Key Gaps
- [ ] **CRITICAL**: `<legend>` element not modeled -- used for formula keys and figure keys (Sec 7.3, 8.3). Contains `<title>` and `<def-list>`
- [ ] **CRITICAL**: `NisoSts::DisplayFormula` missing `<legend>` as a child element -- primary container for formula keys in OSD
- [ ] **CRITICAL**: `NisoSts::DisplayFormula` missing `<non-normative-note>` as a child element -- Sec 7.2 explicitly allows notes after `<mml:math>`
- [ ] **CRITICAL**: `NisoSts::DisplayFormula` missing `<def-list>` as a child element -- needed when legend is not used
- [ ] `NisoSts::DefList` has `@list-type` but guidelines use `@list-content` (value "formula", "figure", "abbreviation") -- possible attribute name mismatch
- [ ] `NisoSts::DefItem` missing `@id` attribute -- all def-items in examples carry IDs
- [ ] `TbxIsoTml::Math` has limited MathML child elements -- missing `<mover>`, `<munder>`, `<mtable>`, `<mtr>`, `<mtd>`, `<mpadded>`, `<maction>`, `<mphantom>`, etc.

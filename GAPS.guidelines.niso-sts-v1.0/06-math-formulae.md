# Section 7: Formulae and Equations

## Overview
Covers display formulae (`<disp-formula>`), inline formulae (`<inline-formula>`), formula groups (`<disp-formula-group>`), formula keys (`<def-list>`), and MathML (`<mml:math>`).

## Element Coverage

### Formula Containers

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<disp-formula>` | Block display formula | `NisoSts::DisplayFormula` | ✅ Supported | In both NisoSts and IsoSts |
| `<inline-formula>` | Inline formula | `NisoSts::InlineFormula` | ✅ Supported | |
| `<disp-formula-group>` | Group of formulae | `NisoSts::DispFormulaGroup` | ✅ Supported | |

### Display Formula

| Attribute/Child | Guidelines Usage | In DisplayFormula | Status | Notes |
|----------------|-----------------|-------------------|--------|-------|
| `@id` | Formula identifier (formula_1 / for-1) | ✅ Mapped | OK | |
| `@content-type` | Content type | ✅ Mapped | OK | |
| `@specific-use` | Specific use | ✅ Mapped | OK | |
| `<label>` | Formula number "(1)" | ✅ Mapped | OK | |
| `<math>` (mml:math) | MathML expression | ✅ Via `TbxIsoTml::Math` | OK | |
| `<graphic>` | Alternative graphic | ✅ Mapped (collection) | OK | |
| `<preformat>` | Preformatted formula | ✅ Mapped | OK | |
| `<tex-math>` | TeX math | ✅ Mapped | OK | |
| `<alternatives>` | Alternative representations | ✅ Mapped | OK | |

### Inline Formula

| Attribute/Child | Guidelines Usage | In InlineFormula | Status | Notes |
|----------------|-----------------|------------------|--------|-------|
| `@id` | Formula identifier | ✅ Mapped | OK | |
| `@content-type` | Content type | ✅ Mapped | OK | |
| `<math>` (mml:math) | MathML expression | ✅ Via `TbxIsoTml::Math` | OK | |
| `<alternatives>` | Alternative representations | ✅ Mapped | OK | |

### Formula Group

| Attribute/Child | Guidelines Usage | In DispFormulaGroup | Status | Notes |
|----------------|-----------------|---------------------|--------|-------|
| `@id` | Group identifier (forg-informal-X-Y) | ✅ Mapped | OK | |
| `@content-type` | Content type | ✅ Mapped | OK | |
| `<label>` | Group label | ✅ Mapped | OK | |
| `<disp-formula>` | Individual formulae | ✅ Mapped (collection) | OK | |
| Text between formulae | e.g. ", or" | ⚠️ Needs verification | Mixed content not declared | Guidelines show text between disp-formula children |

### Formula Keys (Section 7.5)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<def-list list-content="formula">` | Formula key | ⚠️ Partial | `DefList` exists but `@list-content` not mapped | |
| `<label>` "where" | Key label | ✅ Mapped | OK | |
| `<def-item>` | Key entries | ✅ Mapped | OK | |
| `<term>` | Variable symbol | ✅ Mapped | OK | |
| `<def>` | Definition | ✅ Mapped | OK | |
| `<def-head>` (IEC legacy) | Key heading | ❌ Not mapped | Legacy | IEC legacy uses `<def-head>` instead of `<label>` |

## MathML Coverage

The `TbxIsoTml::Math` model supports the following MathML elements:

| MathML Element | In `TbxIsoTml::Math` | Status | Notes |
|---------------|---------------------|--------|-------|
| `@id` | ✅ | OK | |
| `@display` | ✅ ("block") | OK | |
| `<mrow>` | ✅ | OK | |
| `<msub>` | ✅ | OK | |
| `<msup>` | ✅ | OK | |
| `<mn>` | ✅ | OK | |
| `<mo>` | ✅ | OK | |
| `<mi>` | ✅ | OK | |
| `<mtext>` | ✅ | OK | |
| `<mfrac>` | ✅ | OK | |
| `<mspace>` | ✅ | OK | |
| `<semantics>` | ✅ | OK | |
| `<mstyle>` | ✅ | OK | |
| `<mfenced>` | ✅ | OK | |
| `<munderover>` | ✅ | OK | |

### MathML Elements Missing from Model

| MathML Element | Guidelines Usage | In Model | Status | Notes |
|---------------|-----------------|----------|--------|-------|
| `<munder>` | Under scripts | ✅ `TbxIsoTml::Munder` | OK | Exists as separate class |
| `<mover>` | Over scripts | ❌ Not in Math | Missing | |
| `<mtable>` | Math tables | ❌ | Missing | |
| `<mtr>` | Math table rows | ❌ | Missing | |
| `<mtd>` | Math table cells | ❌ | Missing | |
| `<maligngroup>` | Alignment groups | ❌ | Missing | |
| `<malignmark>` | Alignment marks | ❌ | Missing | |
| `<mglyph>` | Math glyphs | ❌ | Missing | |
| `<mlongdiv>` | Long division | ❌ | Missing | |
| `<mscarries>` | Carries | ❌ | Missing | |
| `<mscarry>` | Carry | ❌ | Missing | |
| `<msline>` | Stack line | ❌ | Missing | |
| `<mstack>` | Stack | ❌ | Missing | |
| `<menclose>` | Enclosure notation | ❌ | Missing | |
| `<merror>` | Error message | ❌ | Missing | |
| `<mmultiscripts>` | Multi-scripts | ❌ | Missing | |
| `<mprescripts>` | Pre-scripts | ❌ | Missing | |
| `<msubsup>` | Sub-superscript pair | ❌ | Missing | |
| `<maction>` | Math action | ❌ | Missing | |
| `<mpadded>` | Padded space | ❌ | Missing | |
| `<mphantom>` | Phantom space | ❌ | Missing | |
| `<annotation>` | Annotation | ❌ | Missing | Part of `<semantics>` |
| `<annotation-xml>` | XML annotation | ❌ | Missing | Part of `<semantics>` |

## Attribute Gaps

| Attribute | Parent | Guidelines Usage | Modeled | Status |
|-----------|--------|-----------------|---------|--------|
| `@list-content` | `<def-list>` | "formula" for formula keys | ❌ Not mapped | Missing |

## Key Gaps

- [ ] **`@list-content` not mapped on `DefList`**: Guidelines use `<def-list list-content="formula">` for formula keys and `<def-list list-content="figure">` for figure keys. This attribute is critical for distinguishing key types. Currently only `@list-type` and `@specific-use` exist.

- [ ] **`<def-head>` (IEC legacy) not supported**: IEC legacy sometimes uses `<def-head>` instead of `<label>` in definition lists.

- [ ] **Text content between `<disp-formula>` in `<disp-formula-group>`**: The guidelines show text like ", or" between formula elements. The `DispFormulaGroup` model does not declare mixed content, so this text would be lost.

- [ ] **MathML coverage is limited**: Only ~16 MathML presentation elements are modeled out of the ~35+ defined in the NISO STS schema. Complex formulae using `<mover>`, `<mtable>`, `<menclose>`, `<mmultiscripts>`, etc. will not round-trip correctly. The guidelines explicitly note "we assume that this will be handled by a specialized WYSIWYG tool" -- but for XML round-tripping, more complete MathML support is needed.

- [ ] **`<annotation>` / `<annotation-xml>` not in `<semantics>`**: The `Semantics` model needs to be checked for completeness.

- [ ] **`<mml:math>` namespace handling**: The MathML elements in guidelines use `mml:` prefix. `TbxIsoTml::Math` uses `namespace ::Sts::Namespaces::MathmlNamespace`. Need to verify that this correctly handles the `mml:math`, `mml:mrow`, etc. prefixed elements.

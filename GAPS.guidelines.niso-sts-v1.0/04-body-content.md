# Section 5: Body Content

## Overview
Covers text content elements used within the body: spaces/punctuation, `<label>`, `<title>`, `<p>`, symbols, `<styled-content>`, notes and examples, lists, text alignment (`<array>`), quotations (`<disp-quote>`), graphics, boxed text, code, preformatted text, and editing instructions.

## Element Coverage

### Text Formatting Elements (Section 5.1)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<sup>` | Superscript | `NisoSts::Sup`, `TbxIsoTml::Sup` | ✅ Supported | |
| `<sub>` | Subscript | `NisoSts::Sub`, `TbxIsoTml::Sub` (not found) | ✅ Partial | Sup exists in TbxIsoTml but Sub may not |
| `<italic>` | Italic text | `TbxIsoTml::Italic` | ✅ Supported | |
| `<bold>` | Bold text | `TbxIsoTml::Bold` | ✅ Supported | |
| `<underline>` | Underlined text | `NisoSts::Underline` | ✅ Supported | |
| `<sc>` | Small caps | `NisoSts::Sc` | ✅ Supported | |
| `<strike>` | Strike-through | `NisoSts::Strike` | ✅ Class exists | |
| `<monospace>` | Monospaced text | `NisoSts::Monospace` | ✅ Supported | |
| `<roman>` | Roman (plain) override | `NisoSts::Roman` | ✅ Class exists | Used inside table headers |
| `<overline>` | Overlined text | `NisoSts::Overline` | ✅ Supported | |
| `<sans-serif>` | Sans-serif text | `NisoSts::SansSerif` | ✅ Class exists | |
| `<break/>` | Line break | `NisoSts::Break` | ✅ Supported | |

### Labels and Titles (Section 5.2)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<label>` | Numbers/symbols for display elements | `NisoSts::Label` | ✅ Supported | Mixed content with `<sup>` |
| `<title>` | Designations of elements | `NisoSts::Title`, `IsoSts::Title` | ✅ Supported | |

### Paragraph (Section 5.3)

| Element/Attr | Guidelines Usage | sts-ruby Model | Status | Notes |
|-------------|-----------------|---------------|--------|-------|
| `<p>` | General body text | `NisoSts::Paragraph` | ✅ Supported | Mixed content model |
| `@id` on `<p>` | Paragraph identifier | ✅ Mapped | OK | |
| `@style-type` on `<p>` | Alignment/formatting | ✅ Mapped | OK | Values: align-left, align-right, align-center, valign-top, etc. |
| `@content-type` on `<p>` | Content type (e.g. "dimension") | ❌ Not mapped | Missing | Guidelines Section 6.6.5, 8.4 use `@content-type="dimension"` on `<p>` for unit statements |
| `@specific-use` on `<p>` | Layout instruction (ISO) | ✅ Mapped | OK | |

### Styled Content (Section 5.5)

| Element/Attr | Guidelines Usage | sts-ruby Model | Status | Notes |
|-------------|-----------------|---------------|--------|-------|
| `<styled-content>` | Semantic formatting | `NisoSts::StyledContent` | ✅ Supported | |
| `@style-type` | Addition/deletion/normal | ✅ Mapped | OK | |
| `@style` | CSS-style font info | ✅ Mapped | OK | |
| `@specific-use` | IEC insert/delete | ✅ Mapped | OK | |

### Notes and Examples (Section 5.6)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<non-normative-note>` | Notes in text | `NisoSts::NonNormativeNote` | ✅ Supported | With `@id`, `@content-type`, `<label>`, `<p>`, `<list>` |
| `<non-normative-example>` | Examples in text | `NisoSts::NonNormativeExample` | ✅ Supported | |
| `<normative-note>` | Normative notes | `NisoSts::NormativeNote` | ✅ Class exists | Not mapped in Section children |
| `<normative-example>` | Normative examples | `NisoSts::NormativeExample` | ✅ Class exists | Not mapped in Section children |
| `@content-type="warning"` on note | Warning/caution/important notes | ✅ Mapped | OK | Section 5.6.2 |

### Lists (Section 5.7)

| Element/Attr | Guidelines Usage | sts-ruby Model | Status | Notes |
|-------------|-----------------|---------------|--------|-------|
| `<list>` | Lists | `NisoSts::List` | ✅ Supported | |
| `@list-type` | List type (bullet, dash, alpha-lower, etc.) | ✅ Mapped | OK | |
| `@content-type` | Content type | ✅ Mapped | OK | |
| `<list-item>` | List items | `NisoSts::ListItem` | ✅ Supported | |
| `<label>` in list-item | Bullet/number | ✅ Supported | OK | |
| `<p>` in list-item | List item text | ✅ Supported | OK | |
| Nested `<list>` in list-item | Nested lists | ✅ Supported | OK | |

### Text Alignment / Arrays (Section 5.8)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<array>` | Column-aligned text without borders | `NisoSts::SectionArray` | ✅ Supported | |
| `@id` on `<array>` | Array identifier | ✅ Mapped | OK | |

### Quotations (Section 5.9)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<disp-quote>` | Block quotations | `NisoSts::DispQuote` | ✅ Supported | With `@id`, `@content-type`, `<label>`, `<p>`, `<attrib>` |
| `<attrib>` | Attribution for quotes | `NisoSts::Attribution` | ✅ Supported | |

### Graphics (Section 5.10)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<graphic>` | Block graphics | `NisoSts::Graphic` | ✅ Supported | With `@xlink:href` |
| `<inline-graphic>` | Inline graphics | `NisoSts::InlineGraphic` | ✅ Supported | Rich attribute set |
| `@xlink:href` on `<graphic>` | File reference | ✅ Mapped | OK | |
| `<object-id>` in `<graphic>` | Object identifiers | ✅ Supported | OK | |

### Boxed Text (Section 5.11)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<boxed-text>` | Boxed/guidance text | `NisoSts::BoxedText` | ✅ Supported | With `@content-type="foreign-source"`, `@position`, `@orientation` |
| `<caption>` in boxed-text | Box heading | ✅ Supported | OK | |

### Code (Section 5.12)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<code>` | Programming code | ❌ Missing | No `Code` class | Guidelines list attributes: `@id`, `@code-type`, `@code-version`, `@executable`, `@language`, `@language-version`, `@platforms` |

### Preformatted Text (Section 5.13)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<preformat>` | ASCII art, error messages | `NisoSts::Preformat` | ✅ Supported | With `@xml:space`, `@language`, `@preformat-type` |

### Editing Instructions (Section 5.14)

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<editing-instruction>` | IEC amendment instructions | `NisoSts::EditingInstruction` | ⚠️ Partial | Has `@id`, `@xml:lang`, `@specific-use`, `<label>` but missing `@content-type` and `<p>` child |
| `@content-type` on editing-instruction | addition/replacement/deletion/modification | ❌ Not mapped | Missing | Legacy IEC usage |
| `<p>` in editing-instruction | Instruction text | ❌ Not mapped | Missing | Guidelines show `<p>` children |

## Paragraph Content Gaps

The guidelines show many elements can appear inside `<p>`. Here is what is missing from `NisoSts::Paragraph`:

| Element | In Guidelines `<p>` examples | In Paragraph model | Status |
|---------|------------------------------|-------------------|--------|
| `<bold>` | Yes | ✅ Via TbxIsoTml::Bold | OK |
| `<italic>` | Yes | ✅ Via TbxIsoTml::Italic | OK |
| `<sup>` | Yes | ✅ | OK |
| `<sub>` | Yes | ✅ | OK |
| `<sc>` | Yes | ✅ | OK |
| `<styled-content>` | Yes | ✅ | OK |
| `<xref>` | Yes | ✅ | OK |
| `<std>` | Yes | ✅ | OK |
| `<ext-link>` | Yes | ✅ | OK |
| `<uri>` | Yes | ✅ | OK |
| `<fn>` | Yes | ✅ | OK |
| `<break>` | Yes | ✅ | OK |
| `<inline-formula>` | Yes | ✅ | OK |
| `<inline-graphic>` | Yes | in Paragraph model? | ⚠️ Check -- `<graphic>` is mapped but not `<inline-graphic>` |
| `<named-content>` | Possible | ❌ Not mapped | `NamedContent` class exists but not in Paragraph |
| `<strike>` | Possible | ❌ Not mapped | `Strike` class exists but not in Paragraph |
| `<roman>` | In table headers | ❌ Not mapped | `Roman` class exists but not in Paragraph |
| `<monospace>` | Yes | ✅ | OK |
| `<underline>` | Yes | ✅ | OK |
| `<code>` | Possible in text | ❌ No Code class | Missing |
| `<email>` | Possible | ❌ Not mapped | `Email` class exists but not in Paragraph |
| `<target>` | Possible | ❌ Not mapped | Not in Paragraph |
| `<term>` | In term-display context | ❌ Not mapped | Not in Paragraph |

## NonNormativeNote Content Gaps

| Element | Guidelines Usage | In NonNormativeNote | Status |
|---------|-----------------|---------------------|--------|
| `<label>` | NOTE label | ✅ | OK |
| `<p>` | Note text | ✅ | OK |
| `<list>` | Notes as lists | ✅ | OK |
| `<non-normative-note>` | Nested notes | ❌ Not mapped | Guidelines don't show nested but may occur |
| `<xref>` | Cross-references in notes | ❌ Not mapped | May occur in note text |
| `<std>` | References in notes | ❌ Not mapped | May occur in note text |
| `<styled-content>` | Styled text in notes | ❌ Not mapped | May occur |
| `<fig>` | Figures in notes | ❌ Not mapped | May occur |

## NonNormativeExample Content Gaps

| Element | Guidelines Usage | In NonNormativeExample | Status |
|---------|-----------------|----------------------|--------|
| `<label>` | EXAMPLE label | ✅ | OK |
| `<p>` | Example text | ✅ | OK |
| `<list>` | Lists in examples | ✅ | OK |
| `<table-wrap>` | Tables in examples | ✅ | OK |
| `<non-normative-example>` | Nested examples | ✅ | OK |
| `<xref>` | Cross-references | ❌ Not mapped | May occur |
| `<std>` | References | ❌ Not mapped | May occur |

## BoxedText Content Gaps

| Element | Guidelines Usage | In BoxedText | Status |
|---------|-----------------|-------------|--------|
| `<caption>` | Box heading | ✅ | OK |
| `<p>` | Box content | ✅ | OK |
| `<list>` | Lists in box | ✅ | OK |
| `<array>` | Column text | ❌ Not mapped | Guidelines list this as valid |
| `<boxed-text>` | Nested boxed text | ❌ Not mapped | Guidelines list this |
| `<non-normative-note>` | Notes in box | ❌ Not mapped | Guidelines list this |
| `<non-normative-example>` | Examples in box | ❌ Not mapped | Guidelines list this |
| `<disp-formula>` | Formulae in box | ❌ Not mapped | Guidelines list this |
| `<disp-quote>` | Quotes in box | ❌ Not mapped | Guidelines list this |
| `<ref-list>` | References in box | ❌ Not mapped | Guidelines list this |
| `<table-wrap>` | Tables in box | ❌ Not mapped | Guidelines list this |
| `<fig>` | Figures in box | ❌ Not mapped | Guidelines list this |
| `<graphic>` | Graphics in box | ❌ Not mapped | Guidelines list this |
| `<def-list>` | Definition lists | ❌ Not mapped | |

## Key Gaps

- [ ] **`<code>` element completely missing**: Section 5.12 describes this with 7 attributes. No model exists.

- [ ] **`EditingInstruction` incomplete**: Missing `@content-type` attribute (values: addition, replacement, deletion, modification) and `<p>` child element. IEC amendment coding (Section 5.14) relies heavily on this.

- [ ] **`Paragraph` missing `@content-type`**: Used for dimension/unit statements in tables and figures (Section 6.6.5, 8.4).

- [ ] **`BoxedText` severely limited**: Only has `<caption>`, `<label>`, `<p>`, `<preformat>`, `<list>`. Missing: `<array>`, `<boxed-text>`, `<non-normative-note>`, `<non-normative-example>`, `<disp-formula>`, `<disp-quote>`, `<ref-list>`, `<table-wrap>`, `<fig>`, `<graphic>`, `<def-list>` -- all listed as valid children in Section 5.11.

- [ ] **`NonNormativeNote` missing inline elements**: Notes can contain `<xref>`, `<std>`, `<styled-content>`, `<fig>` etc. Currently only supports `<p>`, `<label>`, `<list>`, `<preformat>`, `<boxed-text>`, `<graphic>`, `<array>`.

- [ ] **`Graphic` model is sparse**: Missing `@id`, `@content-type`, `@position`, `@orientation`, `@mimetype`, `@mime-subtype` attributes. Guidelines examples show `<graphic id="fig_1.1">` with sub-figure captions but `Graphic` has no `id` or child `<label>`/`<caption>`.

# Section 5: Content

## Overview
Section 5 covers content elements: text formatting, labels/titles, paragraphs, symbols, notes, examples, warnings, lists, text alignment arrays, quotations, graphics, and code.

## Element Coverage

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<p>` | General body text | `NisoSts::Paragraph` | Supported | Has `@id`, `@style-type`, `@specific-use`; mixed content |
| `<label>` | Numbering labels | `NisoSts::Label` | Supported | Mixed content with `<sup>` |
| `<title>` | Designation titles | `NisoSts::Title` | Supported | |
| `<bold>` | Bold formatting | `TbxIsoTml::Bold` | Supported | |
| `<italic>` | Italic formatting | `TbxIsoTml::Italic` | Supported | |
| `<underline>` | Underline formatting | `NisoSts::Underline` | Supported | |
| `<strike>` | Strikethrough | `NisoSts::Strike` | Supported | |
| `<monospace>` | Monospace font | `NisoSts::Monospace` | Supported | |
| `<sub>` | Subscript | `NisoSts::Sub` | Supported | |
| `<sup>` | Superscript | `NisoSts::Sup` | Supported | In `TbxIsoTml` namespace |
| `<sc>` | Small caps | `NisoSts::Sc` | Supported | |
| `<named-content>` | Variable quantities with `@content-type="variable"` | `NisoSts::NamedContent` | Partial | Missing `<sup>`, `<sub>`, `<italic>` children needed for variable symbols |
| `<non-normative-note>` | Notes in body text | `NisoSts::NonNormativeNote` | Supported | Has `@id`, `@content-type`, `<label>`, `<p>` |
| `<non-normative-example>` | Examples in body text | `NisoSts::NonNormativeExample` | Supported | Has `@id`, `<label>`, `<p>` |
| `<list>` | Ordered and unordered lists | `NisoSts::List` | Supported | Has `@list-type`, `@id`, `@content-type` |
| `<list-item>` | Items in lists | `NisoSts::ListItem` | Partial | Missing `@id` attribute |
| `<array>` | Text alignment tables | `NisoSts::SectionArray` | Partial | Only contains `<table>`, not colgroup or other structures |
| `<disp-quote>` | Block quotations | `NisoSts::DispQuote` | Partial | Missing `<permissions>` child; uses `<attribution>` instead of `<attrib>` with `@specific-use="source"` |
| `<graphic>` | Block graphics | `NisoSts::Graphic` | Partial | Missing `@id`, `@specific-use` attributes; missing `<label>`, `<caption>` children (ISO sub-figures B.2.16) |
| `<inline-graphic>` | Inline graphics | `NisoSts::InlineGraphic` | Supported | Has `@specific-use`, `@href`, etc. |
| `<code>` | Code blocks (new) | Missing | Missing | **Critical gap** -- replaces `<preformat>` for code; planned `@language`, `@language-version` attributes |
| `<inline-code>` | Inline code (new) | Missing | Missing | **Critical gap** -- inline equivalent of `<code>` |
| `<preformat>` | Preformatted text (legacy) | `NisoSts::Preformat` | Supported | Legacy, being replaced by `<code>` |
| `<styled-content>` | Styled text with semantic meaning | `NisoSts::StyledContent` | Supported | Has `@style`, `@style-type`, `@specific-use` |
| `<break>` | Line breaks | `NisoSts::Break` | Supported | |

## Attribute Gaps

| Attribute | Parent Element | Guidelines Usage | Modeled | Status |
|-----------|---------------|-----------------|---------|--------|
| `@content-type` | `<p>` | "dimension" for unit statements, "warning" for warnings | No | Missing on `Paragraph` |
| `@list-type` | `<list>` | "alpha-lower", "arabic", "roman-lower", "dash", "bullet", "simple", "order", "roman-upper", "alpha-upper", "symbol", "other" | Yes | Supported |
| `@style-type` | `<p>` | Alignment: "align-left", "align-right", "align-center", etc. (legacy) | Yes | Supported |
| `@xlink:href` | `<graphic>` | Reference to graphic file | Yes | Supported (via `:xlink_href`) |
| `@specific-use` | `<graphic>` | Size indicator: "size:T", "size:S", "size:M", "size:L" | No | Missing on `Graphic` |
| `@id` | `<graphic>` | Element identifier | No | Missing on `Graphic` |
| `@id` | `<list-item>` | Element identifier (Sec 3.4) | No | Missing on `ListItem` |
| `@content-type` | `<non-normative-note>` | "warning" for warnings | Yes | Supported |
| `@language` | `<code>` | Code language (planned) | N/A | Element missing |
| `@language-version` | `<code>` | Code language version (planned) | N/A | Element missing |

## Key Gaps
- [ ] **CRITICAL**: `<code>` element not modeled -- the primary element for code blocks in new content (replacing `<preformat>`)
- [ ] **CRITICAL**: `<inline-code>` element not modeled -- inline code equivalent
- [ ] `NisoSts::Paragraph` missing `@content-type` attribute -- guidelines use `<p content-type="dimension">` for unit statements in figures and tables
- [ ] `NisoSts::Graphic` missing `@id` attribute -- listed in Sec 3.4 as needing ID
- [ ] `NisoSts::Graphic` missing `@specific-use` attribute -- guidelines define size indicators (size:T, size:S, size:M, size:L)
- [ ] `NisoSts::Graphic` missing `<label>` and `<caption>` children -- ISO uses these for sub-figure captions (B.2.16)
- [ ] `NisoSts::ListItem` missing `@id` attribute -- listed in Sec 3.4 as needing ID
- [ ] `NisoSts::NamedContent` missing child elements (`<sup>`, `<sub>`, `<italic>`) -- needed for variable quantity symbols (Sec 5.5)
- [ ] `NisoSts::DispQuote` uses `<attribution>` but guidelines show `<attrib specific-use="source">` (Sec 5.9)
- [ ] `NisoSts::DispQuote` missing `<permissions>` child -- guidelines mention permissions within disp-quote
- [ ] `NisoSts::NonNormativeNote` missing `<xref>` child -- needed for references within notes
- [ ] `NisoSts::NonNormativeNote` missing `<non-normative-note>` child (nested notes in legacy B.2.10)

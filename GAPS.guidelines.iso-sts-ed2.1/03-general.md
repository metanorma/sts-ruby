# Section 3: General

## Overview
Section 3 covers general coding guidance, Online Standards Development (OSD), elements containing IDs, editorial notes, and formatting conventions. It introduces key structural patterns and lists elements that should carry `@id` attributes.

## Element Coverage

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<standard>` | Root element for standards documents | `NisoSts::Standard` | Partial | Missing `@xmlns:xi`, `@xmlns:xsi` attributes; missing `<processing-meta>` child |
| `<processing-meta>` | New in Ed 2.1 - metadata about the XML file (tagset, MathML version, table model, TBX model) | Missing | Missing | **Critical gap** - new element introduced in Ed 2.1 |
| `<front>` | Front matter container | `NisoSts::Front` | Supported | |
| `<body>` | Body container | `NisoSts::Body` | Supported | |
| `<back>` | Back matter container | `NisoSts::Back` | Supported | |

## Attribute Gaps

| Attribute | Parent Element | Guidelines Usage | Modeled | Status |
|-----------|---------------|-----------------|---------|--------|
| `@base-tagset` | `<processing-meta>` | "interchange" | N/A | Missing (parent element missing) |
| `@mathml-version` | `<processing-meta>` | "3.0" | N/A | Missing (parent element missing) |
| `@table-model` | `<processing-meta>` | "xhtml" | N/A | Missing (parent element missing) |
| `@terminology-model` | `<processing-meta>` | "tbx" | N/A | Missing (parent element missing) |
| `@math-representation` | `<processing-meta>` | "mathml" | N/A | Missing (parent element missing) |
| `@tagset-family` | `<processing-meta>` | "sts" | N/A | Missing (parent element missing) |
| `@xmlns:xi` | `<standard>` | XInclude namespace declaration | No | Missing attribute |
| `@xmlns:xsi` | `<standard>` | XML Schema Instance namespace | No | Missing attribute |
| `@mml` | `<standard>` | MathML namespace (modeled as attribute) | Partial | Modeled as `:string`, not as namespace declaration |
| `@tbx` | `<standard>` | TBX namespace (modeled as attribute) | Partial | Modeled as `:string`, not as namespace declaration |

## ID-Bearing Elements (Sec 3.4 Checklist)

The guidelines list 31 elements that should carry `@id`. Checking whether sts-ruby models support `@id`:

| Element | Has `@id` attribute | Notes |
|---------|-------------------|-------|
| `<app-group>` | Yes | |
| `<app>` | Yes | |
| `<code>` | N/A | Element not modeled |
| `<def-item>` | No | Missing `@id` on `DefItem` |
| `<def-list>` | Yes | |
| `<disp-formula>` | Yes | |
| `<fig>` | Yes | |
| `<fig-group>` | Yes | |
| `<graphic>` | No | Missing `@id` on `Graphic` |
| `<inline-code>` | N/A | Element not modeled |
| `<inline-formula>` | Yes | |
| `<inline-graphic>` | Yes | |
| `<legend>` | N/A | Element not modeled |
| `<list-item>` | No | Missing `@id` on `ListItem` |
| `<mml:math>` | Yes | |
| `<mixed-citation>` | No | Missing `@id` |
| `<p>` | Yes | |
| `<ref>` | Yes | |
| `<ref-list>` | Yes | |
| `<sec>` | Yes | |
| `<std>` | No | Missing `@id` on `ReferenceStandard` |
| `<table-wrap>` | Yes | |
| `<table-wrap-foot>` | No | Missing `@id` on `TableWrapFoot` |
| `<tbx:example>` | Yes | |
| `<tbx:note>` | Yes | |
| `<tbx:termEntry>` | Yes | |
| `<tbx:tig>` | Yes | |
| `<term-sec>` | Yes | |
| `<xref>` | No | Missing `@id` on `Xref` |

## Key Gaps
- [ ] **CRITICAL**: `<processing-meta>` element not modeled -- new in Ed 2.1 with attributes `@base-tagset`, `@mathml-version`, `@table-model`, `@terminology-model`, `@math-representation`, `@tagset-family`, and child `<custom-meta-group>`
- [ ] **CRITICAL**: `<code>` element not modeled -- guidelines specify it for code blocks (replaces legacy `<preformat>`)
- [ ] **CRITICAL**: `<inline-code>` element not modeled -- inline code equivalent of `<code>`
- [ ] Missing `@id` on `<def-item>`, `<graphic>`, `<list-item>`, `<mixed-citation>`, `<std>`, `<table-wrap-foot>`, `<xref>` -- all listed in Sec 3.4 as needing IDs
- [ ] `<legend>` element not modeled -- used for formula keys and figure keys (Sec 7.3, 8.3)
- [ ] `NisoSts::Standard` does not map `<processing-meta>` as a child element
- [ ] `NisoSts::Permissions` does not model `<license>` as a child element
- [ ] `NisoSts::Permissions` maps `copyright-statement` as `:string` but guidelines show it can contain `<inline-graphic>` (IEC copyright)

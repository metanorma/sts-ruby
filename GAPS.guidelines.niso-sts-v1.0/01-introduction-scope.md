# Section 1-3: Introduction, Legal Terms, and General Scope

## Overview
Covers the maintenance, legal terms, scope, coding guidance, tagging differences between ISO and IEC, formatting conventions, and multilingual document handling.

## Element Coverage

| Element | Guidelines Usage | sts-ruby Model | Status | Notes |
|---------|-----------------|---------------|--------|-------|
| `<standard>` | Root element for all NISO STS documents | `NisoSts::Standard`, `IsoSts::Standard` | ✅ Supported | Both NisoSts and IsoSts variants exist |
| `@xml:lang` | Language attribute on block-level elements | Mapped as `lang` on Standard, various models | ✅ Supported | Used on `<standard>`, `<title-wrap>`, `<abstract>` etc. |
| `xmlns:mml` | MathML namespace declaration | `Namespaces::MathmlNamespace` | ✅ Supported | Declared via `namespace_scope` on Standard |
| `xmlns:tbx` | TBX namespace declaration | `Namespaces::TbxNamespace` | ✅ Supported | Declared via `namespace_scope` on Standard |
| `xmlns:xlink` | XLink namespace declaration | `Namespaces::XlinkNamespace` | ✅ Supported | Declared via `namespace_scope` on Standard |

## Attribute Gaps

| Attribute | Parent Element | Guidelines Usage | Modeled | Status |
|-----------|---------------|-----------------|---------|--------|
| `@dtd-version` | `<standard>` | DTD version identifier | ✅ Mapped on both NisoSts::Standard and IsoSts::Standard | OK |
| `@specific-use` | `<standard>` | Usage at IsoSts | ✅ Mapped on IsoSts::Standard only | OK -- NisoSts does not have it |

## Key Gaps

- [ ] **No `@xml:lang` on `NisoSts::Standard`**: The NisoSts::Standard maps `lang` but it uses `Lutaml::Xml::W3c::XmlLangType` which should correctly handle `xml:lang`. Verify round-trip fidelity.
- [ ] **`xmlns` namespace attributes not round-tripped as XML attributes**: The `mml`, `tbx`, `xlink` attributes on `NisoSts::Standard` are declared but mapped through `namespace_scope`, not as individual XML attributes. The guidelines example shows `xmlns:mml="..."` etc. directly on `<standard>`. Verify this serializes correctly.
- No structural gaps in this section -- it is primarily about conventions.

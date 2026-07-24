# 01: Investigation Findings — Fn/FnGroup Duplication

**Status**: complete (findings documented for reference)

## Six classes discovered

| Class | File | Ruby attr for `<p>` | Other notable attrs |
|---|---|---|---|
| `Sts::IsoSts::Fn` | `lib/sts/iso_sts/fn.rb` | `:paragraph` | fn_type, specific_use, symbol, xml_lang, non_normative_note, non_normative_example |
| `Sts::IsoSts::FnGroup` | `lib/sts/iso_sts/fn_group.rb` | — | content_type, specific_use, xml_lang, originator, label, title |
| `Sts::NisoSts::Fn` | `lib/sts/niso_sts/fn.rb` | `:paragraph` | (minimal) |
| `Sts::NisoSts::FnGroup` | `lib/sts/niso_sts/fn_group.rb` | — | (minimal) |
| `Sts::TbxIsoTml::Fn` | `lib/sts/tbx_iso_tml/fn.rb` | `:p` ← **outlier** | (minimal) |
| `Sts::TbxIsoTml::FnGroup` | `lib/sts/tbx_iso_tml/fn_group.rb` | — | (minimal) |

## Call sites (24 total)

### IsoSts (8 sites — all wrong, should be IsoSts::Fn)
- `lib/sts/iso_sts/{td,bold,paragraph,mixed_citation,sec,th,std,italic}.rb`

### IsoSts (correct — already uses IsoSts::Fn/IsoSts::FnGroup)
- `lib/sts/iso_sts/{fig,table_wrap_foot,fn_group,app,back,term_sec}.rb`

### TbxIsoTml (4 sites — should be NisoSts::Fn following Bold/Italic pattern)
- `lib/sts/tbx_iso_tml/{td,th,table_wrap_foot,fn_group}.rb`

### TbxIsoTml (correct — already uses NisoSts::Fn)
- `lib/sts/tbx_iso_tml/{bold,italic}.rb`

### NisoSts (correct — uses NisoSts::Fn/NisoSts::FnGroup)
- `lib/sts/niso_sts/{author_notes,source,data_title,named_content,mixed_citation,paragraph,section,back,display_formula,role,reference_standard,contrib,styled_content,toc,boxed_text,fn_group}.rb`

## Verification of root cause

Patch on `Lutaml::Xml::Transformation#apply_standard_rules` showed: when `Sts::TbxIsoTml::Fn` is serialized inside a `Sts::NisoSts::Back` (whose `:fn_group` is typed `NisoSts::FnGroup`), the transformation applied has `model_class = Sts::NisoSts::Fn` (not `TbxIsoTml::Fn`). Its compiled rules include `attribute_name=:paragraph`, which is then `public_send`-ed on the TbxIsoTml::Fn value, raising `NoMethodError`.

The reverse also fails: `NisoSts::Fn` inside `TbxIsoTml::FnGroup` raises `private method 'p' called`.

The cache key in `TransformationRegistry#transformation_key` includes `object_id`, so cache collision is NOT the cause. The bug is in `ElementBuilder#create_nested_model_element` — it reuses `rule.child_transformation` (cached at compile time for the declared `attribute_type`) without consulting `value.class`.

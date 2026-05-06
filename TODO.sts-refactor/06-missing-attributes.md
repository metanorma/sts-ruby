# 06: Missing Attributes Implementation

**Priority**: HIGH
**Category**: Feature Gap
**Estimated Effort**: Medium
**Files Affected**: Existing model files

## `@id` Missing on Elements (From Guidelines Sec 3.4)

The IEC/ISO Coding Guidelines ed.2.1 Section 3.4 lists elements that MUST carry `@id`. These are missing in sts-ruby:

| Element | Current Model | Has `@id` | Fix |
|---------|--------------|-----------|-----|
| `<def-item>` | `DefItem` | No | Add `attribute :id, :string` |
| `<graphic>` | `Graphic` | No | Add `attribute :id, :string` |
| `<list-item>` | `ListItem` | No | Add `attribute :id, :string` |
| `<mixed-citation>` | `MixedCitation` | No | Add `attribute :id, :string` |
| `<std>` | `ReferenceStandard` | No | Add `attribute :id, :string` |
| `<table-wrap-foot>` | `TableWrapFoot` | No | Add `attribute :id, :string` |
| `<xref>` | `Xref` | No | Add `attribute :id, :string` |

### Implementation Pattern

```ruby
# For each affected model, add:
attribute :id, :string

# In xml block:
map_attribute "id", to: :id
```

## New Attributes from NISO STS 1.2

### `@stage-code` on `<release-version>`
```ruby
attribute :stage_code, :string
# map_attribute "stage-code", to: :stage_code
```

### `@assigning-authority` Added to Multiple Elements
Per NISO STS 1.2 Section 7:
- `<article-id>`, `<award-id>`, `<compound-kwd>`, `<compound-subject>`
- `<contrib-id>`, `<institution-id>`, `<issue-id>`, `<journal-id>`
- `<kwd>`, `<kwd-group>`, `<nested-kwd>`, `<object-id>`
- `<resource-id>`, `<subject>`, `<subj-group>`, `<volume-id>`

### `@award-id-type`, `@award-type`, XLink on `<award-id>`
Per NISO STS 1.2 Section 7:
```ruby
attribute :award_id_type, :string
attribute :award_type, :string
attribute :xlink_href, :string
attribute :xlink_type, :string
attribute :xlink_role, :string
attribute :xlink_title, :string
attribute :xlink_show, :string
attribute :xlink_actuate, :string
```

### `@custom-type` / `@custom-value` Solution
Per NISO STS 1.2 Section 7, these attributes get custom-type/custom-value:
- `@form-type`
- `@person-group-type`
- `@pub-id-type`
- `@related-term-type`
- `@ref-type`
- `std/@type` (dated, undated, multipart)
- `std-ref/@type`

### `@dtd-version` Made Optional with Value List
```ruby
attribute :dtd_version, :string
# Values: "iso-0.9", "iso-1.0", "iso-1.1", "1.0", "1.1d1", "1.2"
```

### `@degree-contribution` on `<role>`
```ruby
attribute :degree_contribution, :string
```

### `@hreflang` on XLink-bearing Elements
Added to any element with `@xlink:href`:
- `<related-article>`, `<related-object>`, and all elements with xlink

### `@originator` on Multiple Elements
Per NISO STS 1.2 Section 7:
- `<meta-date>`, `<release-date>`, `<release-version-id>`
- `<secretariat>`, `<self-uri>`, `<wi-number>`

### `@style-detail` on `<styled-content>` and `<list>`
```ruby
attribute :style_detail, :string
# Usage: <list list-type="bullet" style-detail="dash">
```

### `@use-type` on `<std>`, `<mixed-citation>`, `<element-citation>`
```ruby
attribute :use_type, :string
```

### `@vocab` and `@vocab-identifier`
Added to: `<kwd>`, `<compound-kwd>`, `<nested-kwd>`, `<subject>`, `<compound-subject>`, `<inline-media>`, `<institution-id>`

### `@vocab-term` and `@vocab-term-identifier` on `<inline-media>`

### `@specific-use` on `<release-version>`

### New `xref/@ref-type` Value: "abbreviation"

### `@list-type` Added Value: "arabic"

## `@xml:lang` Missing on Multilingual Elements

IEC documents use multiple languages. Check and add `@xml:lang` to:
- `<p>`, `<title>`, `<term>`, `<def>`, `<label>`, `<caption>`
- Any element in `MetadataStd` that supports multi-language variants

## `@content-type` Missing
- `<p>` (NisoSts) — already has, verify
- `<editing-instruction>` — missing per IEC guidelines

## Implementation Order

1. Fix `@id` on 7 elements (trivial, high impact)
2. Add `@originator` to elements that need it
3. Add `@assigning-authority` to listed elements
4. Add `@xml:lang` to multilingual elements
5. Add `@style-detail`, `@use-type`, `@custom-type` attributes
6. Add XLink attributes to `<award-id>`
7. Add remaining NISO STS 1.2 attributes

## Dependencies

- `04-register-versioning.md` — some attributes are version-specific

## TODO Checklist

- [x] Add `@id` to 7 elements listed above
- [x] Add `@originator` to elements (Paragraph, Section, Abstract, App, DispQuote, List, NormativeNote, NonNormativeNote, DefList)
- [x] Add `@assigning-authority` to 16 elements (XSD has it on `ext-link` only — done)
- [x] Add `@xml:lang` to multilingual elements (Label, Caption, DefItem, DefList)
- [x] Add NISO STS 1.2 specific attributes (vocab, vocab-identifier on IcsWrap, KwdGroup, NamedContent, Role, SubjGroup, Term)
- [x] Add missing attributes to `<award-id>` (id, specific-use, xml:lang)
- [x] Add missing attributes to `<ext-link>` (assigning-authority, id, specific-use, xml:lang, xlink attrs)
- [x] Add missing attributes to `<title>` (content-type, id, specific-use)
- [x] Add missing attributes to `<caption>` (id, specific-use, xml:lang)
- [x] Add `@vocab`/`@vocab-identifier` to elements (IcsWrap, KwdGroup, NamedContent, Role, SubjGroup, Term)
- [ ] Verify attribute mappings match XSD/DTD (OASIS CALS remaining)
- [x] Add `@id` to all 161 NisoSts models that have `@id` in XSD
- [x] Add `@id` to 32 TbxIsoTml models
- [x] Add `@id` to 29 IsoSts models
- [x] Run round-trip tests after each batch

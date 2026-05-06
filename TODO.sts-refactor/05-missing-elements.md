# 05: Missing Elements Implementation

**Priority**: HIGH
**Category**: Feature Gap
**Estimated Effort**: High
**Files Affected**: New model files, autoload entries

## Elements Missing from sts-ruby

### Critical (Round-Trip Impact)

#### `<processing-meta>` (NISO STS 1.2)
- **Parent**: `<standard>` (peer to `<front>`, `<body>`, `<back>`)
- **Attributes**: `@tagset-family`, `@base-tagset`, `@table-model`, `@mathml`, `@math-representation`, `@terminology-model`
- **Children**: `<extended-by>`, `<restricted-by>`, `<custom-meta-group>`
- **Reference**: NISO STS 1.2 comparison doc, Section 3

#### `<code>` (NISO STS 1.2)
- **Parents**: `<p>`, `<sec>`, `<list-item>`, and many block contexts
- **Attributes**: `@code-type`, `@code-version`, `@content-type`, `@executable`, `@id`, `@language`, `@language-version`, `@xml:base`, `@xml:lang`
- **Content**: Mixed (text + inline elements)
- **Reference**: NISO STS 1.2, Section 4

#### `<inline-code>` (NISO STS 1.2)
- **Parents**: Inline contexts
- **Attributes**: Same pattern as `<code>` but for inline usage
- **Reference**: NISO STS 1.2, Section 4

#### `<legend>` (NISO STS 1.2)
- **Parents**: `<boxed-text>`, `<chem-struct-wrap>`, `<disp-formula>`, `<disp-formula-group>`, `<fig>`, `<fig-group>`, `<graphic>`, `<media>`, `<supplementary-material>`, `<table-wrap>`, `<table-wrap-group>`
- **Children**: Mixed content with emphasis elements
- **Reference**: NISO STS 1.2, Section 4

#### `<inline-media>` (NISO STS 1.2)
- **Parents**: Inline contexts
- **Attributes**: Standard media attributes
- **Reference**: NISO STS 1.2, Section 4

#### `<sub-part-number>` (NISO STS 1.2)
- **Parent**: `<std-ident>`
- **Content**: String
- **Reference**: NISO STS 1.2, Section 4

#### `<index>` Hierarchy
- `<index>` — container for back matter index
- `<index-div>` — index division
- `<index-entry>` — individual index entry
- `<index-title-group>` — index title
- `<index-term-range-end>` — range end marker
- `<see-entry>` — "see" cross-reference
- `<see-also-entry>` — "see also" cross-reference
- **Reference**: GAPS.guidelines.schema-xref.md

#### `<toc>` Hierarchy
- `<toc>` — table of contents container (in `<front>`)
- `<toc-div>` — TOC division
- `<toc-entry>` — TOC entry
- `<toc-title-group>` — TOC title
- `<toc-group>` — TOC group (in `<sec>`)
- **Reference**: GAPS.guidelines.schema-xrf.md

#### `<table-wrap-group>`
- **Parents**: `<sec>`, `<app>`
- **Children**: `<table-wrap>` collection
- **Reference**: GAPS.guidelines.schema-xref.md

#### `<sec-meta>`
- **Parent**: `<sec>`
- **Content**: Section metadata
- **Reference**: GAPS.guidelines.schema-xref.md

#### `<std-doc-meta>`
- **Parent**: `<front>`
- **Content**: Standard document metadata
- **Reference**: GAPS.guidelines.schema-xref.md

### Table Model (OASIS CALS) — Lower Priority

| Element | Notes |
|---------|-------|
| `<tgroup>` | Table group with column specs |
| `<colspec>` | Column specification |
| `<row>` | Table row |
| `<entry>` | Table cell |

Most modern ISO documents use XHTML tables. OASIS CALS needed for legacy documents.

### Less Critical / Edge Cases

| Element | Notes |
|---------|-------|
| `<abbrev>` | Abbreviation display element |
| `<article-categories>` | JATS legacy — skip for NISO STS |
| `<article-id>` | JATS legacy — skip |
| `<article-meta>` | JATS legacy — skip |
| `<compl-title-wrap>` | Complementary title wrap |
| `<compound-subject>` | Compound subject |
| `<compound-subject-part>` | Part of compound subject |
| `<count>` | Count element |
| `<fallback>` | Alternatives fallback |
| `<fixed-case>` | Fixed-case text |
| `<free_to_read>` | ALI namespace |
| `<glyph-data>` | Private character glyph data |
| `<glyph-ref>` | Private character glyph reference |
| `<include>` | XInclude element |
| `<intro-title-wrap>` | Introduction title wrap |
| `<issue-id>` | Journal issue ID — skip |
| `<issue-part>` | Journal issue part — skip |
| `<issue-sponsor>` | Journal issue sponsor — skip |
| `<issue-title>` | Journal issue title — skip |
| `<journal-id>` | Journal ID — skip |
| `<license_ref>` | ALI license reference |
| `<main-title-wrap>` | Main title wrap |
| `<nav-pointer>` | Navigation pointer |
| `<nav-pointer-group>` | Navigation pointer group |
| `<num>` | Number element |
| `<overline-end>` | Overline end marker |
| `<overline-start>` | Overline start marker |
| `<part-title>` | Part title |
| `<sub-part>` | Sub-part element |
| `<title-group>` | Title group |
| `<trans-subtitle>` | Translated subtitle |
| `<underline-end>` | Underline end marker |
| `<underline-start>` | Underline start marker |
| `<term-display-string>` | New in NISO STS 1.2 |

## Implementation Order

1. `<processing-meta>` — needed for schema validation routing
2. `<code>` and `<inline-code>` — high frequency in real documents
3. `<legend>` — needed for formula/figure keys
4. `<inline-media>` — straightforward
5. `<index>` hierarchy — needed for back matter
6. `<toc>` hierarchy — needed for front matter
7. `<table-wrap-group>` — grouped table handling
8. `<sec-meta>` and `<std-doc-meta>` — structural metadata
9. OASIS CALS tables — legacy support
10. Edge case elements — as needed

## File Structure

Each new element follows the established pattern:

```ruby
# lib/sts/niso_sts/processing_meta.rb
module Sts
  module NisoSts
    class ProcessingMeta < Lutaml::Model::Serializable
      attribute :tagset_family, :string
      attribute :base_tagset, :string
      attribute :table_model, :string
      attribute :mathml, :string
      attribute :math_representation, :string
      attribute :terminology_model, :string
      attribute :extended_by, ExtendedBy, collection: true
      attribute :restricted_by, RestrictedBy, collection: true
      attribute :custom_meta_group, CustomMetaGroup

      xml do
        element "processing-meta"
        map_attribute "tagset-family", to: :tagset_family
        map_attribute "base-tagset", to: :base_tagset
        map_attribute "table-model", to: :table_model
        map_attribute "mathml", to: :mathml
        map_attribute "math-representation", to: :math_representation
        map_attribute "terminology-model", to: :terminology_model
        map_element "extended-by", to: :extended_by
        map_element "restricted-by", to: :restricted_by
        map_element "custom-meta-group", to: :custom_meta_group
      end
    end
  end
end
```

## Dependencies

- `04-register-versioning.md` — new elements should be registered in appropriate version namespace

## TODO Checklist

- [x] `<processing-meta>` with all attributes
- [x] `<code>` and `<inline-code>`
- [x] `<legend>`
- [x] `<inline-media>`
- [x] `<sub-part-number>` in `<std-ident>`
- [x] `<index>` hierarchy (7 elements)
- [x] `<toc>` hierarchy (5 elements)
- [x] `<table-wrap-group>`
- [x] `<sec-meta>`
- [x] `<std-doc-meta>` (expanded to full XSD model)
- [x] `<term-display-string>` (NISO STS 1.2)
- [ ] OASIS CALS table elements
- [x] Update autoload entries for all new elements
- [x] Add/update round-trip tests for each element

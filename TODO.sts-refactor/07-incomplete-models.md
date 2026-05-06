# 07: Incomplete Models Fix

**Priority**: MEDIUM
**Category**: Feature Gap
**Estimated Effort**: Medium
**Files Affected**: Existing model files

## Models Needing Completion

### 1. Permissions (Critical — IEC License Data Lost)

**Current**: `copyright_statement` is `:string`, `copyright_holder` is single string
**Needed**:
- `copyright_statement` → mixed content (supports `<inline-graphic>`, `<br/>`)
- `copyright_holder` → collection (multiple holders)
- Add `<license>` child element
- Add `<license-p>` child element (paragraphs within license)
- Add `<license_ref>` (ALI namespace, `ali:license_ref`)
- Add `<ext-link>` child

```ruby
# Current (WRONG)
attribute :copyright_statement, :string
attribute :copyright_holder, :string

# Fixed
attribute :copyright_statement, :string  # keep as mixed_content
attribute :copyright_holder, :string, collection: true
attribute :license, License, collection: true
attribute :copyright_year, :string
attribute :copyright_month, :string
attribute :copyright_day, :string
```

### 2. EditingInstruction (IEC Amendment Data)

**Current**: Missing `@content-type` and `<p>` child
**Needed**:
- `@content-type` attribute
- `<p>` as repeatable child
- Support for IEC amendment instructions

### 3. TermDisplay (IEC Term Content)

**Current**: Exists but missing critical children
**Needed**:
- `<term>` element support
- `<def>` element support
- `<list>` element support
- `<xref>` element support
- `<label>` element support
- `<term-display-string>` (NISO STS 1.2)

### 4. DefList

**Current**: Missing `@list-content` attribute
**Needed**:
- `@list-content` attribute (formula-key, figure-key, abbreviation-key)
- Proper relationship to DefItem children

### 5. Graphic

**Current**: Missing `@id`, `<label>`, `<caption>` children
**Needed**:
- `@id` attribute
- `<label>` child (for sub-figure captions)
- `<caption>` child
- `<alt-text>` child

### 6. Front (NisoSts)

**Current**: Missing `<std-doc-meta>` wiring
**Needed**:
- `<std-doc-meta>` child element
- Support for multiple `<std-meta>` (adoption documents)
- Proper metadata hierarchy

### 7. BoxedText

**Current**: Most valid children missing
**Needed**:
- `<table-wrap>`, `<fig>`, `<disp-formula>`, `<list>`
- `<p>`, `<caption>`, `<label>`
- `<sec>` (nested sections in boxed text)
- All emphasis and inline elements

### 8. DispFormula

**Current**: Missing `<caption>` (added in NISO STS 1.2)
**Needed**:
- `<caption>` child element

### 9. Source (Citation Source)

**Current**: Missing inline elements added in NISO STS 1.2
**Needed**:
- `<abbrev>`, `<alternatives>`, `<inline-graphic>`, `<private-char>`
- `<chem-struct>`, `<inline-formula>`, `<mml:math>`, `<tex-math>`
- `<named-content>`, `<styled-content>`, `<fn>`, `<target>`, `<xref>`

### 10. InlineFormula

**Current**: Missing accessibility elements (NISO STS 1.2)
**Needed**:
- `<alt-text>` child
- `<long-desc>` child

### 11. AwardGroup

**Current**: Missing new NISO STS 1.2 elements
**Needed**:
- `<award-name>` child
- `<award-desc>` child

### 12. DataTitle

**Current**: Missing `<inline-graphic>`, `<private-char>` (NISO STS 1.2)
**Needed**:
- `<inline-graphic>` child
- `<private-char>` child

### 13. Table Cells (td, th)

**Current**: Expanded to full XSD inside-cell content model
**Done**: disp-quote, speech, and statement are NOT in XSD inside-cell group.
Td/Th now include: disp-formula, disp-formula-group, element-citation, mixed-citation,
all emphasis elements, fig, fig-group, inline-graphic, private-char, normative-note,
normative-example, non-normative-example, email, ext-link, named-content,
alternatives, code, media, preformat, target, array

### 14. StringName Usage Expansion (NISO STS 1.2)

`<string-name>` added to:
- `<contrib>`, `<person-group>`, `<name-alternatives>`
- `<related-article>`, `<related-object>`
- `<mixed-citation>`, `<element-citation>`

### 15. SubjGroup and KwdGroup Expansion (NISO STS 1.2)

`<subj-group>` and `<kwd-group>` added to:
- `<app>`, `<boxed-text>`, `<sec>`, `<app-group>`
- `<chem-struct-wrap>`, `<disp-formula>`, `<disp-formula-group>`
- `<fig>`, `<fig-group>`, `<graphic>`, `<media>`, `<statement>`
- `<supplementary-material>`, `<table-wrap>`, `<table-wrap-group>`

## Implementation Order

1. Permissions — highest impact, IEC documents
2. Graphic — sub-figure support
3. TermDisplay — terminology sections
4. DefList — definition lists
5. EditingInstruction — amendments
6. Front/std-doc-meta — document structure
7. BoxedText — content completeness
8. NISO STS 1.2 additions (DispFormula, Source, InlineFormula, etc.)

## Dependencies

- `04-register-versioning.md` — version-specific additions
- `05-missing-elements.md` — some children are new elements

## TODO Checklist

- [x] Fix Permissions model (mixed content, collection, license)
- [x] Fix Graphic model (add @id, label, caption)
- [x] Fix TermDisplay model (add term, def, list, xref, label)
- [x] Fix DefList model (add @list-content, @originator, @continued-from, @prefix-word, @xml:lang, term_head, def_head, editing_instruction)
- [x] Fix EditingInstruction model (add @content-type, @rid, title, p)
- [x] Fix Front model (add std-doc-meta, reg-meta, nat-meta, ack, notes, toc)
- [x] Fix BoxedText model (add valid children)
- [x] Fix Back model (add index, toc, ack, notes, glossary, bio, label, title)
- [x] Add DispFormula caption (NISO STS 1.2) — expanded DisplayFormula with caption, originator, mixed content
- [x] Expand Source inline elements (NISO STS 1.2) — full inline element support with attributes
- [x] Add InlineFormula accessibility (NISO STS 1.2) — alt-text, long-desc, emphasis elements
- [x] Add AwardGroup elements (NISO STS 1.2) — rid, specific-use, xlink attrs, collection recipients
- [x] Add DataTitle elements (NISO STS 1.2) — full inline elements with attributes
- [x] Expand SubjGroup/KwdGroup locations (NISO STS 1.2) — SubjGroup recursive nesting, compound-subject
- [x] Expand table cell content (NISO STS 1.2) — full XSD inside-cell content model
- [x] Expand StringName usage (NISO STS 1.2) — added to name-alternatives
- [x] Run round-trip tests after each model fix

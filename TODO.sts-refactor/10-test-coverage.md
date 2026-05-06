# 10: Test Coverage Improvements

**Priority**: ONGOING
**Category**: Quality
**Estimated Effort**: Ongoing
**Files Affected**: `spec/`

## Current Test Structure

```
spec/
├── spec_helper.rb
├── sts_spec.rb                   # Core parsing/serialization tests
├── round_trip/
│   └── reference_docs_spec.rb    # Round-trip tests with ISO doc fixtures
└── fixtures/
    └── *.xml                     # Test XML documents
```

## Test Categories Needed

### 1. Unit Tests Per Element

Each model class should have unit tests covering:

```ruby
# spec/sts/niso_sts/paragraph_spec.rb
RSpec.describe Sts::NisoSts::Paragraph do
  describe "XML parsing" do
    it "parses <p> with text content"
    it "parses <p> with mixed content"
    it "parses <p> with @id attribute"
    it "parses <p> with @content-type attribute"
    it "parses <p> with @xml:lang attribute"
  end

  describe "XML serialization" do
    it "round-trips text content"
    it "round-trips mixed content"
    it "round-trips all attributes"
  end
end
```

Priority elements for unit tests:
- `Standard`, `Front`, `Body`, `Back` — structural
- `Section`, `Paragraph` — high frequency
- `Fig`, `TableWrap`, `Graphic` — media
- `Ref`, `RefList`, `Xref` — references
- `TermSec`, `TermDisplay` — terminology
- `Permissions` — after model fix

### 2. Schema Validation Tests

```ruby
# spec/schema_validation_spec.rb
RSpec.describe "Schema compliance" do
  context "NISO STS 1.0" do
    it "validates against NISO STS Extended XSD"
    it "validates against NISO STS Interchange XSD"
  end

  context "ISOSTS v1.1" do
    it "validates against ISOSTS DTD"
  end

  context "NISO STS 1.2" do
    it "validates against NISO STS 1.2 XSD"
  end
end
```

### 3. Version-Specific Tests (After TODO 04)

```ruby
# spec/versioning/register_spec.rb
RSpec.describe "Schema versioning" do
  it "loads ISOSTS v1.1 register independently"
  it "loads NISO STS 1.0 register independently"
  it "loads NISO STS 1.2 register independently"
  it "prevents cross-register contamination"
end
```

### 4. Profile Validation Tests (After TODO 08)

```ruby
# spec/profiles/iso_iec_validator_spec.rb
RSpec.describe Sts::Profiles::IsoIec::Validator do
  it "rejects document without <front>"
  it "accepts valid ISO document"
  it "validates ID scheme conventions"
  it "validates metadata requirements"
end
```

### 5. Anti-Pattern Regression Tests

```ruby
# spec/anti_patterns_spec.rb
RSpec.describe "No anti-patterns in codebase" do
  it "contains no method_missing definitions"
  it "contains no respond_to_missing definitions"
  it "contains no send calls"
  it "contains no Object.const_get calls"
end
```

### 6. Performance Tests

```ruby
# spec/performance_spec.rb
RSpec.describe "Performance" do
  it "parses large document within time budget"
  it "serialization doesn't regress from baseline"
end
```

## Test Fixtures Needed

| Fixture | Purpose | Priority |
|---------|---------|----------|
| Simple standard (minimal) | Basic round-trip | HIGH |
| IEC standard with license | Permissions testing | HIGH |
| Document with index | Index hierarchy | HIGH |
| Document with TOC | TOC hierarchy | HIGH |
| Document with code blocks | Code element testing | HIGH |
| Document with MathML | Formula testing | MEDIUM |
| Document with TBX | Terminology testing | MEDIUM |
| Document with OASIS tables | CALS table testing | LOW |
| Multi-language document | xml:lang testing | MEDIUM |
| Amendment/corrigendum | Amendment structure | MEDIUM |
| National adoption | std-doc-meta testing | LOW |

## Coverage Metrics

Track coverage with:
```bash
COVERAGE=true bundle exec rspec
```

Target: >80% line coverage for `lib/sts/`

## Dependencies

All other TODOs feed into this — add tests as features are implemented.

## TODO Checklist

- [x] Add anti-pattern regression test
- [x] Add unit tests for structural elements (Standard, Front, Body, Back)
- [x] Add unit tests for Section and Paragraph
- [x] Add unit tests for Fig, TableWrap, Graphic
- [x] Add unit tests for Ref, RefList, Xref
- [x] Add unit tests for TermSec, TermDisplay
- [x] Add unit tests for Permissions (after model fix)
- [x] Add unit tests for new elements (ProcessingMeta, Code, Legend, InlineMedia, TableWrapGroup, DefHead)
- [x] Add unit tests for attribute additions (Title, Caption, Label, ExtLink, AwardId, DefItem)
- [x] Add unit tests for Index and TOC hierarchy elements
- [ ] Add schema validation tests
- [ ] Add versioning tests (after TODO 04)
- [x] Add profile validation tests (after TODO 08)
- [x] Set up coverage tracking
- [x] Achieve >80% line coverage target (achieved 99.8%)

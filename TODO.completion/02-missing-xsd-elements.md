# Priority B: Implement Missing XSD Elements

## Issue

Elements defined in the NISO STS XSD that are not currently implemented in the Ruby library.

## Investigation Results

### index-term
Defined in XSD at line 2806 of `NISO-STS-extended-1-mathml3-elements.xsd`. Uses `index-term-model` group which contains:
- `term` element
- nested `index-term` (optional)
- `see` and `see-also` elements

### Elements NOT in Current Fixtures
Searched all 6 test fixture files - **none contain**:
- `index-term` or `index-term-range-end`
- `glyph`, `kbd`, `option`, `seq`, `term-span`, `stream`

These elements exist in the XSD schema definition but are not used in actual XML files.

## Conclusion

**Deferred - Not Currently Needed**

These elements can be implemented when/if they are needed. The current implementation works for all test fixtures.

## If Needed Later

Create:
- `lib/sts/niso_sts/index_term.rb`
- `lib/sts/niso_sts/index_term_range_end.rb`

And add autoloads to `lib/sts/niso_sts.rb`.

## Status

- [x] Search XSD for index-term-model group definition
- [x] Verify which elements are actually needed
- [x] **Conclusion: Not needed for current fixtures - deferred**

---
**Priority B is effectively complete - no action needed.**

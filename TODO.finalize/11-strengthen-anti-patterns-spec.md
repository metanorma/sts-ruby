# 11: Strengthen `anti_patterns_spec.rb` (deferred)

**Status**: deferred — track for future improvement
**Priority**: low

## Why

The current `spec/anti_patterns_spec.rb` checks for `method_missing`, `respond_to_missing?`, `Object.const_get`, `.send(` — but misses several global-rule patterns. The MathML hack file (`lib/sts/iso_sts/mathml2/math.rb`, since deleted in TODO 02 of the prior audit) had `instance_variable_set`, `respond_to?(:read)`, and hand-rolled `to_xml` — none would have been caught.

## Add checks for

- [ ] `instance_variable_set` / `instance_variable_get` (forbidden by global rule)
- [ ] `respond_to?` for type-checking (allowed only inside test infrastructure or explicit adapter negotiation — define an allowlist)
- [ ] Hand-rolled serialization methods on `Lutaml::Model::Serializable` subclasses: `def to_h`, `def to_hash`, `def from_h`, `def from_hash`, `def to_json`, `def from_json`, `def to_xml`, `def from_xml`, `def serialize`, `def deserialize`
- [ ] `require_relative` anywhere in `lib/` (autoloads only — global rule)
- [ ] `double(` in specs (global rule)

## Implementation notes

- The existing pattern (file-by-file source scan) extends naturally — add new `it` blocks per check.
- Some checks may need an allowlist (e.g., `respond_to?` for IO vs String detection at gem boundaries). Document the allowlist inline.
- Run after every lib change, not just at PR time.

This is **not** in scope for the current PR series. Track as a follow-up.

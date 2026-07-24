# 07: lutaml-model specs for cross-class dispatch

**Status**: DEFERRED (follows step 06)

See step 06 for the deferral rationale. When 06 is revisited, the specs described below should accompany it.

## Originally planned specs

- Cross-class dispatch: parent declares `attribute :child, ParentClass`; caller assigns `OtherSerializable.new` (not a subtype). Serialization uses `OtherSerializable`'s mapping rules.
- Round-trip preserved: parsing the serialized XML yields an instance whose attributes match the original.
- Declared-type fast path unchanged: assigning a `ParentClass` instance uses the cached `child_transformation`.
- Subtype polymorphism (existing `is_polymorphic_subtype` behaviour) still works.

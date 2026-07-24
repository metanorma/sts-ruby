# 10: Audit other potential duplicates (deferred)

**Status**: deferred — track for future investigation
**Priority**: medium

## Why

The Fn/FnGroup duplication suggests `TbxIsoTml` may contain other JATS / NISO STS elements misclassified as TBX. Each duplicate is a potential version-mismatch footgun. A one-time audit would surface them.

## Suspects to investigate

Cross-reference each `TbxIsoTml::*` class against the TBX-ISO-TML (ISO 30042) element list. Anything NOT in TBX-ISO-TML is a misfit. Likely candidates:

- `TbxIsoTml::Xref` — `<xref>` is a JATS element
- `TbxIsoTml::TableWrap` — `<table-wrap>` is JATS / NISO STS
- `TbxIsoTml::Table`, `TbxIsoTml::Thead`, `TbxIsoTml::Tbody`, `TbxIsoTml::Tfoot`, `TbxIsoTml::Tr`, `TbxIsoTml::Th`, `TbxIsoTml::Td`, `TbxIsoTml::Col`, `TbxIsoTml::Colgroup` — XHTML table model, not TBX
- `TbxIsoTml::Caption` — `<caption>` is JATS
- `TbxIsoTml::FnGroup` (deleted in step 02)
- `TbxIsoTml::List` (if present) — `<list>` is JATS

True TBX-ISO-TML elements (must stay): `TermEntry`, `Tig`, `Term`, `TermInformationGroup`, `EntailedTerm`, `Descrip`, `DescripGrp`, `Note` (TBX-spec note, not JATS note), `Definition`, `Source`, `LangSet`, `SubjectField`, `PartOfSpeech`, etc.

## Verification approach for each suspect

1. Check ISO 30042 / TBX-INFO documentation for the element name.
2. If NOT in TBX-ISO-TML: should not exist in `Sts::TbxIsoTml::*`.
3. Decide: delete (if no semantic difference from the JATS / NISO STS equivalent) or move to the correct namespace.

This is **not** in scope for the current PR series. Track as a follow-up.

# frozen_string_literal: true

# NisoSts metadata repeatable-element cardinality specs. Per NISO STS v1.2
# XSD, most children of <iso-meta>, <reg-meta>, <nat-meta>, <std-meta> are
# maxOccurs="unbounded". A singular Ruby attribute silently drops all but
# the last value when the document has multiple of the same element.
#
# Two children (<comm-ref> and <secretariat>) commonly appear as empty
# elements in real fixtures. lutaml-model 0.8.19 drops empty elements from
# string collections on round-trip, so those two stay singular with
# value_map to preserve the empty element. Tracked in
# ~/src/lutaml/lutaml-model/BUGREPORT.collection-empty-element-dropped.md.
RSpec.describe Sts::NisoSts do
  def expect_collection(model_name, attr)
    model = described_class.const_get(model_name)
    expect(model.attributes[attr].options[:collection]).to be(true)
  end

  def expect_singular(model_name, attr)
    model = described_class.const_get(model_name)
    expect(model.attributes[attr].options[:collection]).to be_nil
  end

  shared_examples "metadata cardinality" do |model_name:, collections:, singular_for_empty:, singular_per_schema:|
    collections.each do |attr|
      it "#{model_name}##{attr} is a collection (maxOccurs=unbounded)" do
        expect_collection(model_name, attr)
      end
    end

    singular_for_empty.each do |attr|
      it "#{model_name}##{attr} stays singular (empty-element preservation)" do
        expect_singular(model_name, attr)
      end
    end

    singular_per_schema.each do |attr|
      it "#{model_name}##{attr} stays singular (schema maxOccurs=1)" do
        expect_singular(model_name, attr)
      end
    end
  end

  describe "MetadataIso" do
    it_behaves_like "metadata cardinality",
                    model_name: :MetadataIso,
                    collections: %i[content_language custom_meta_group ics meta_date
                                    permissions release_date std_ref std_xref title_wrap],
                    singular_for_empty: %i[comm_ref secretariat],
                    singular_per_schema: %i[doc_ident doc_ref page_count pub_date std_ident]
  end

  describe "MetadataStd" do
    it_behaves_like "metadata cardinality",
                    model_name: :MetadataStd,
                    collections: %i[content_language std_org_group self_uri],
                    singular_for_empty: %i[comm_ref secretariat],
                    singular_per_schema: %i[]
  end

  describe "RegMeta" do
    it_behaves_like "metadata cardinality",
                    model_name: :RegMeta,
                    collections: %i[release_date ics],
                    singular_for_empty: %i[comm_ref secretariat],
                    singular_per_schema: %i[]
  end

  describe "NatMeta" do
    it_behaves_like "metadata cardinality",
                    model_name: :NatMeta,
                    collections: %i[release_date ics],
                    singular_for_empty: %i[comm_ref secretariat],
                    singular_per_schema: %i[]
  end

  describe "regression: MetadataIso preserves multiple std-ref" do
    it "serialises multiple std-ref entries (BUGREPORT reproduction)" do
      sr1 = Sts::NisoSts::StandardRef.new
      sr1.type = "dated"
      sr1.value = "ISO 8601-1:2019"
      sr2 = Sts::NisoSts::StandardRef.new
      sr2.type = "undated"
      sr2.value = "ISO 8601-1"

      meta = Sts::NisoSts::MetadataIso.new
      meta.std_ref = [sr1, sr2]

      xml = meta.to_xml
      expect(xml).to include("<std-ref")
      expect(xml.scan(/<std-ref\b/).length).to eq(2)
      expect(xml).to include("ISO 8601-1:2019")
      expect(xml).to include("ISO 8601-1")
    end
  end

  # <comm-ref/> and <secretariat/> commonly appear as empty elements in
  # real fixtures. PR #55 made the attributes singular with value_map on
  # the mapping to preserve empty elements through round-trip. The
  # value_map was applied correctly in MetadataStd but missed in three
  # sibling classes (MetadataIso partially, RegMeta, NatMeta entirely).
  # This spec asserts the trade-off applies uniformly across all four.
  describe "empty-element preservation across all four metadata classes" do
    {
      "iso-meta" => Sts::NisoSts::MetadataIso,
      "reg-meta" => Sts::NisoSts::RegMeta,
      "nat-meta" => Sts::NisoSts::NatMeta,
      "std-meta" => Sts::NisoSts::MetadataStd,
    }.each do |element, klass|
      it "<#{element}> preserves empty <comm-ref/> and <secretariat/>" do
        xml = %(<#{element} id="t"><comm-ref/><secretariat/></#{element}>)
        round_trip = klass.to_xml(klass.from_xml(xml))
        expect(round_trip).to include("<comm-ref"),
                              "#{element} lost <comm-ref/> on round-trip"
        expect(round_trip).to include("<secretariat"),
                              "#{element} lost <secretariat/> on round-trip"
      end
    end
  end
end

# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Reference models" do
  describe Sts::NisoSts::Reference do
    it "round-trips ref with label and mixed-citation" do
      xml = <<~XML
        <ref id="ref1" content-type="standard">
          <label>1</label>
          <mixed-citation publication-type="standard">ISO 9001:2015</mixed-citation>
        </ref>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("ref1")
      expect(parsed.content_type).to eq("standard")
      expect(parsed.label).not_to be_nil
      expect(parsed.mixed_citation).not_to be_nil
    end

    it "round-trips ref with std element" do
      xml = <<~XML
        <ref id="ref2">
          <label>2</label>
          <std std-id="iso:std:iso:9001:ed-4:en">
            <std-ref>ISO 9001:2015</std-ref>
          </std>
        </ref>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("ref2")
      expect(parsed.std.length).to eq(1)
    end
  end

  describe Sts::NisoSts::ReferenceList do
    it "round-trips ref-list with title and refs" do
      xml = <<~XML
        <ref-list id="rl1" content-type="normative">
          <title>Normative References</title>
          <ref id="r1">
            <label>1</label>
            <mixed-citation>ISO 9001</mixed-citation>
          </ref>
          <ref id="r2">
            <label>2</label>
            <mixed-citation>ISO 14001</mixed-citation>
          </ref>
        </ref-list>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("rl1")
      expect(parsed.content_type).to eq("normative")
      expect(parsed.title).not_to be_nil
      expect(parsed.ref.length).to eq(2)
    end

    it "round-trips nested ref-list" do
      xml = <<~XML
        <ref-list id="rl2">
          <title>References</title>
          <ref-list id="rl3">
            <title>Normative</title>
          </ref-list>
        </ref-list>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.ref_list.length).to eq(1)
      expect(parsed.ref_list.first.id).to eq("rl3")
    end
  end

  describe Sts::TbxIsoTml::Xref do
    it "round-trips xref with rid and ref-type" do
      xml = <<~XML
        <xref id="xr1" rid="sec1" ref-type="sec">Section 1</xref>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("xr1")
      expect(parsed.rid).to eq("sec1")
      expect(parsed.ref_type).to eq("sec")
      expect(parsed.value).to include("Section 1")
    end

    it "round-trips xref with sup child" do
      xml = <<~XML
        <xref rid="fn1" ref-type="fn"><sup>1</sup></xref>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.rid).to eq("fn1")
      expect(parsed.ref_type).to eq("fn")
      expect(parsed.sup).not_to be_nil
    end
  end
end

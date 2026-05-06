# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Index and TOC hierarchy elements" do
  describe Sts::NisoSts::Index do
    it "round-trips XML with attributes and children" do
      xml = <<~XML
        <index id="idx1" index-type="subject" xml:lang="en">
          <index-title-group>
            <title>Subject Index</title>
          </index-title-group>
          <index-entry id="ie1">
            <term>Accuracy</term>
            <see-also-entry>see also Precision</see-also-entry>
          </index-entry>
          <index-div id="id1" content-type="alpha">
            <index-title-group><title>A</title></index-title-group>
            <index-entry>
              <term>Algorithm</term>
              <see-entry>see Method</see-entry>
            </index-entry>
          </index-div>
        </index>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("idx1")
      expect(parsed.index_type).to eq("subject")
      expect(parsed.index_title_group).to be_a(Sts::NisoSts::IndexTitleGroup)
      expect(parsed.index_entry.size).to eq(1)
      expect(parsed.index_div.size).to eq(1)
      expect(parsed.index_entry.first.see_also_entry.size).to eq(1)
      expect(parsed.index_div.first.index_entry.size).to eq(1)
      expect(parsed.index_div.first.index_entry.first.see_entry.size).to eq(1)

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::IndexDiv do
    it "round-trips nested index-div" do
      xml = <<~XML
        <index-div id="id1">
          <index-entry><term>Foo</term></index-entry>
          <index-div id="id2">
            <index-entry><term>Bar</term></index-entry>
          </index-div>
        </index-div>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.index_entry.size).to eq(1)
      expect(parsed.index_div.size).to eq(1)
      expect(parsed.index_div.first.index_entry.first.term).to eq("Bar")

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::IndexEntry do
    it "round-trips with see and see-also entries" do
      xml = <<~XML
        <index-entry id="ie1" sort-key="accuracy">
          <term>Accuracy</term>
          <see-entry rid="sec_5">see Section 5</see-entry>
          <see-also-entry rid="sec_7">see also Precision</see-also-entry>
        </index-entry>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.sort_key).to eq("accuracy")
      expect(parsed.term).to eq("Accuracy")
      expect(parsed.see_entry.size).to eq(1)
      expect(parsed.see_also_entry.size).to eq(1)
      expect(parsed.see_entry.first.rid).to eq("sec_5")

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::SeeEntry do
    it "round-trips mixed content" do
      xml = '<see-entry rid="s1">see Method</see-entry>'
      parsed = described_class.from_xml(xml)
      expect(parsed.rid).to eq("s1")
      expect(parsed.content).to eq(["see Method"])
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::SeeAlsoEntry do
    it "round-trips mixed content" do
      xml = '<see-also-entry rid="s2">also Precision</see-also-entry>'
      parsed = described_class.from_xml(xml)
      expect(parsed.rid).to eq("s2")
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::Toc do
    it "round-trips XML with toc-div and toc-entry" do
      xml = <<~XML
        <toc id="toc1">
          <toc-title-group>
            <title>Contents</title>
          </toc-title-group>
          <toc-entry id="te1">
            <label>1</label>
            <title>Scope</title>
          </toc-entry>
          <toc-div id="td1">
            <toc-title-group><title>Annexes</title></toc-title-group>
            <toc-entry>
              <label>A</label>
              <title>Normative references</title>
            </toc-entry>
          </toc-div>
        </toc>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("toc1")
      expect(parsed.toc_entry.size).to eq(1)
      expect(parsed.toc_div.size).to eq(1)
      expect(parsed.toc_entry.first.label).to be_a(Sts::NisoSts::Label)

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::TocEntry do
    it "round-trips nested toc-entry" do
      xml = <<~XML
        <toc-entry id="te1">
          <label>3</label>
          <title>Terms and definitions</title>
          <toc-entry>
            <label>3.1</label>
            <title>General</title>
          </toc-entry>
        </toc-entry>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.toc_entry.size).to eq(1)
      expect(parsed.toc_entry.first.title.first.content).to eq(["General"])

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end
end

# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Structural model fixes" do
  describe Sts::NisoSts::BoxedText do
    it "round-trips with full attributes and children" do
      xml = <<~XML
        <boxed-text
          id="bt1"
          content-type="formula"
          form-type="group"
          orientation="portrait"
          originator="ISO"
          position="anchor"
          specific-use="display"
          xml:lang="en">
          <label>Formula 1</label>
          <caption><title>Key formulas</title></caption>
          <p>A paragraph inside boxed text.</p>
          <list list-type="bullet">
            <list-item><p>Item 1</p></list-item>
          </list>
          <attrib>Source: ISO 9001</attrib>
        </boxed-text>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("bt1")
      expect(parsed.content_type).to eq("formula")
      expect(parsed.form_type).to eq("group")
      expect(parsed.originator).to eq("ISO")
      expect(parsed.label).to be_a(Sts::NisoSts::Label)
      expect(parsed.caption).to be_a(Sts::NisoSts::Caption)
      expect(parsed.paragraphs.size).to eq(1)
      expect(parsed.list.size).to eq(1)
      expect(parsed.attrib.size).to eq(1)

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::Front do
    it "round-trips with std-doc-meta and toc" do
      xml = <<~XML
        <front>
          <std-meta>
            <std-ident>
              <originator>ISO</originator>
              <doc-type>IS</doc-type>
            </std-ident>
          </std-meta>
          <toc id="toc1">
            <toc-title-group>
              <title>Contents</title>
            </toc-title-group>
          </toc>
        </front>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.std_meta).to be_a(Sts::NisoSts::MetadataStd)
      expect(parsed.toc.size).to eq(1)

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::Back do
    it "round-trips with index, toc, and glossary" do
      xml = <<~XML
        <back id="back1">
          <ref-list><title>References</title></ref-list>
          <index id="idx1">
            <index-title-group><title>Index</title></index-title-group>
          </index>
          <toc id="toc2">
            <toc-title-group><title>Contents</title></toc-title-group>
          </toc>
        </back>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("back1")
      expect(parsed.ref_list.size).to eq(1)
      expect(parsed.index.size).to eq(1)
      expect(parsed.toc.size).to eq(1)

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe "@originator attribute" do
    it "is present on Paragraph" do
      xml = '<p id="p1" originator="ISO">Text</p>'
      parsed = Sts::NisoSts::Paragraph.from_xml(xml)
      expect(parsed.originator).to eq("ISO")
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end

    it "is present on Section" do
      xml = '<sec id="s1" originator="ISO"><title>Scope</title></sec>'
      parsed = Sts::NisoSts::Section.from_xml(xml)
      expect(parsed.originator).to eq("ISO")
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end

    it "is present on List" do
      xml = '<list id="l1" originator="ISO" list-type="bullet"></list>'
      parsed = Sts::NisoSts::List.from_xml(xml)
      expect(parsed.originator).to eq("ISO")
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end
end

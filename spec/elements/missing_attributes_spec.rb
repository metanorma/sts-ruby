# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Missing attribute additions" do
  describe Sts::NisoSts::Title do
    it "round-trips XML with content-type and id attributes" do
      xml = "<title content-type=\"main\" " \
            "id=\"t1\" specific-use=\"scope\">A Title</title>"
      parsed = described_class.from_xml(xml)
      expect(parsed.content_type).to eq("main")
      expect(parsed.id).to eq("t1")
      expect(parsed.specific_use).to eq("scope")
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::Caption do
    it "round-trips XML with id and xml:lang attributes" do
      xml = <<~XML
        <caption id="cap1" specific-use="summary" xml:lang="en">
          <title>Test Caption</title>
        </caption>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("cap1")
      expect(parsed.specific_use).to eq("summary")
      expect(parsed.xml_lang).to eq("en")
      expect(parsed.title).to be_a(Sts::NisoSts::Title)

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::Label do
    it "round-trips XML with xml:lang attribute" do
      xml = '<label xml:lang="fr">1</label>'
      parsed = described_class.from_xml(xml)
      expect(parsed.xml_lang).to eq("fr")
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::ExtLink do
    it "round-trips XML with assigning-authority and xlink attributes" do
      xml = <<~XML
        <ext-link
          id="el1"
          assigning-authority="ISO"
          ext-link-type="url"
          specific-use="external"
          xml:lang="en"
          xlink:href="https://example.com"
          xlink:title="Example"
          xlink:show="new">Click here</ext-link>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("el1")
      expect(parsed.assigning_authority).to eq("ISO")
      expect(parsed.ext_link_type).to eq("url")
      expect(parsed.specific_use).to eq("external")
      expect(parsed.xml_lang).to eq("en")

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::AwardId do
    it "round-trips XML with id, specific-use, and xml:lang attributes" do
      xml = "<award-id id=\"aw1\" specific-use=\"funding\" " \
            "xml:lang=\"en\">GRANT-123</award-id>"
      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("aw1")
      expect(parsed.specific_use).to eq("funding")
      expect(parsed.xml_lang).to eq("en")
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::DefItem do
    it "round-trips XML with xml:lang attribute" do
      xml = <<~XML
        <def-item id="di1" specific-use="preferred" xml:lang="en">
          <term>foo</term>
          <def><p>A definition.</p></def>
        </def-item>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("di1")
      expect(parsed.specific_use).to eq("preferred")
      expect(parsed.xml_lang).to eq("en")
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end
end

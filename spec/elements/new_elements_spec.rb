# frozen_string_literal: true

require "spec_helper"

RSpec.describe "New element models" do
  describe Sts::NisoSts::ProcessingMeta do
    it "round-trips XML with all attributes" do
      xml = <<~XML
        <processing-meta
          id="pm1"
          tagset-family="sts"
          base-tagset="iso"
          table-model="xhtml"
          math-representation="mathml"
          mathml-version="3.0"
          terminology-model="tbx-iso-tml">
          <restricted-by>iso</restricted-by>
          <extended-by>niso-sts-extended</extended-by>
          <custom-meta-group>
            <custom-meta>
              <meta-name>test</meta-name>
              <meta-value>1</meta-value>
            </custom-meta>
          </custom-meta-group>
        </processing-meta>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("pm1")
      expect(parsed.tagset_family).to eq("sts")
      expect(parsed.base_tagset).to eq("iso")
      expect(parsed.table_model).to eq("xhtml")
      expect(parsed.math_representation).to eq("mathml")
      expect(parsed.mathml_version).to eq("3.0")
      expect(parsed.terminology_model).to eq("tbx-iso-tml")
      expect(parsed.restricted_by.size).to eq(1)
      expect(parsed.extended_by.size).to eq(1)

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::RestrictedBy do
    it "round-trips mixed content" do
      xml = "<restricted-by>iso</restricted-by>"
      parsed = described_class.from_xml(xml)
      expect(parsed.content).to eq(["iso"])
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::ExtendedBy do
    it "round-trips mixed content" do
      xml = "<extended-by>niso-sts-extended</extended-by>"
      parsed = described_class.from_xml(xml)
      expect(parsed.content).to eq(["niso-sts-extended"])
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::Code do
    it "round-trips XML with attributes and inline elements" do
      xml = <<~XML
        <code
          id="c1"
          language="ruby"
          code-version="1.0"
          xml:space="preserve">puts <bold>"hello"</bold></code>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("c1")
      expect(parsed.language).to eq("ruby")
      expect(parsed.code_version).to eq("1.0")
      expect(parsed.bold.size).to eq(1)

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::InlineCode do
    it "round-trips XML with attributes" do
      xml = <<~XML
        <inline-code id="ic1" language="python">x = 1</inline-code>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("ic1")
      expect(parsed.language).to eq("python")

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::Legend do
    it "round-trips XML with child elements" do
      xml = <<~XML
        <legend id="leg1">
          <p>A legend paragraph.</p>
        </legend>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("leg1")
      expect(parsed.p.size).to eq(1)

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::InlineMedia do
    it "round-trips XML with all xlink attributes" do
      xml = <<~XML
        <inline-media
          id="im1"
          mimetype="image"
          mime-subtype="png"
          xlink:href="fig1.png"
          alt="Figure 1"/>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("im1")
      expect(parsed.mimetype).to eq("image")
      expect(parsed.mime_subtype).to eq("png")
      expect(parsed.xlink_href).to eq("fig1.png")
      expect(parsed.alt).to eq("Figure 1")

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::TableWrapGroup do
    it "round-trips XML with table-wrap children" do
      xml = <<~XML
        <table-wrap-group id="twg1">
          <label>Tables</label>
          <caption><title>Group of tables</title></caption>
        </table-wrap-group>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("twg1")
      expect(parsed.label).to be_a(Sts::NisoSts::Label)
      expect(parsed.caption).to be_a(Sts::NisoSts::Caption)

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::DefHead do
    it "round-trips mixed content" do
      xml = '<def-head id="dh1">Definition</def-head>'
      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("dh1")
      expect(parsed.content).to eq(["Definition"])
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end
end

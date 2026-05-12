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

  describe Sts::TbxIsoTml::Note do
    it "round-trips simple text content" do
      xml = '<tbx:note xmlns:tbx="urn:iso:std:iso:30042:ed-1">The term "time" is often used in common language.</tbx:note>'
      parsed = described_class.from_xml(xml)
      expect(parsed.value).to include('The term "time" is often used in common language.')
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end

    it "round-trips mixed content with entailedTerm" do
      xml = <<~XML
        <tbx:note xmlns:tbx="urn:iso:std:iso:30042:ed-1">Common forms of date include <tbx:entailedTerm target="term_7.8">calendar date (7.8)</tbx:entailedTerm>, <tbx:entailedTerm target="term_7.9">ordinal date (7.9)</tbx:entailedTerm> and <tbx:entailedTerm target="term_7.10">week date (7.10)</tbx:entailedTerm>.</tbx:note>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.entailed_term.size).to eq(3)
      expect(parsed.entailed_term[0].target).to eq("term_7.8")
      expect(parsed.value.join).to include("Common forms of date include")
      expect(parsed.value.join).to include(",")
      expect(parsed.value.join).to include("and")
      expect(parsed.value.join).to include(".")

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end

    it "round-trips mixed content with id and italic" do
      xml = '<tbx:note xmlns:tbx="urn:iso:std:iso:30042:ed-1" id="not_3.1.3_2">NOTE 2 In this part of ISO 13849, "fault" means <italic>random fault</italic>.</tbx:note>'
      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("not_3.1.3_2")
      expect(parsed.italic.size).to eq(1)
      expect(parsed.value.join).to include('NOTE 2 In this part of ISO 13849, "fault" means')
      expect(parsed.value.join).to include(".")

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end

    it "round-trips mixed content with std" do
      xml = '<tbx:note xmlns:tbx="urn:iso:std:iso:30042:ed-1">This definition corresponds with the definition of the term "date" in <std><std-ref>IEC 60050-113:2011</std-ref>, 113-01-12</std>.</tbx:note>'
      parsed = described_class.from_xml(xml)
      expect(parsed.std.size).to eq(1)
      expect(parsed.value.join).to include("This definition corresponds")
      expect(parsed.value.join).to include(".")

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end
end

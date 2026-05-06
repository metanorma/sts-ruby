# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Modified element models" do
  describe Sts::NisoSts::DefList do
    it "round-trips XML with new attributes and elements" do
      xml = <<~XML
        <def-list
          id="dl1"
          continued-from="dl0"
          list-content="definitions"
          list-type="order"
          originator="ISO"
          prefix-word="and"
          specific-use="scope"
          xml:lang="en">
          <editing-instruction content-type="query" rid="q1">
            <label>Q1</label>
            <p>Check this definition.</p>
          </editing-instruction>
          <label>Definitions</label>
          <title>Key Terms</title>
          <term-head>Term</term-head>
          <def-head>Definition</def-head>
          <def-item id="di1">
            <term>foo</term>
            <def><p>A foo is a bar.</p></def>
          </def-item>
        </def-list>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("dl1")
      expect(parsed.continued_from).to eq("dl0")
      expect(parsed.list_content).to eq("definitions")
      expect(parsed.list_type).to eq("order")
      expect(parsed.originator).to eq("ISO")
      expect(parsed.prefix_word).to eq("and")
      expect(parsed.xml_lang).to eq("en")
      expect(parsed.editing_instruction.size).to eq(1)
      expect(parsed.editing_instruction.first.content_type).to eq("query")
      expect(parsed.editing_instruction.first.rid).to eq("q1")
      expect(parsed.term_head).to be_a(Sts::NisoSts::TermHead)
      expect(parsed.def_head).to be_a(Sts::NisoSts::DefHead)
      expect(parsed.def_item.size).to eq(1)

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::EditingInstruction do
    it "round-trips XML with content-type, rid, title, and p" do
      xml = <<~XML
        <editing-instruction
          id="ei1"
          content-type="query"
          rid="sec1"
          specific-use="review">
          <label>Q1</label>
          <title>Check reference</title>
          <p>Verify this reference is correct.</p>
        </editing-instruction>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.id).to eq("ei1")
      expect(parsed.content_type).to eq("query")
      expect(parsed.rid).to eq("sec1")
      expect(parsed.specific_use).to eq("review")
      expect(parsed.label).to be_a(Sts::NisoSts::Label)
      expect(parsed.title).to eq("Check reference")
      expect(parsed.p.size).to eq(1)

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::Permissions do
    it "round-trips XML with multiple copyright-holders and licenses" do
      xml = <<~XML
        <permissions>
          <copyright-statement>All rights reserved.</copyright-statement>
          <copyright-year>2024</copyright-year>
          <copyright-holder>ISO</copyright-holder>
          <copyright-holder>IEC</copyright-holder>
          <license>
            <license-p>CC BY 4.0</license-p>
          </license>
        </permissions>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.copyright_statement).to eq("All rights reserved.")
      expect(parsed.copyright_year).to eq("2024")
      expect(parsed.copyright_holder).to eq(%w[ISO IEC])
      expect(parsed.license.size).to eq(1)

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::TermDisplay do
    it "round-trips XML with child elements" do
      xml = <<~XML
        <term-display>
          <term-display-string>foo</term-display-string>
          <label>1</label>
          <def>
            <p>A definition.</p>
          </def>
        </term-display>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.term_display_string).to eq(["foo"])
      expect(parsed.label).to be_a(Sts::NisoSts::Label)
      expect(parsed.definition).to be_a(Sts::NisoSts::Def)

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::StandardIdentification do
    it "round-trips XML with sub-part-number" do
      xml = <<~XML
        <std-ident>
          <originator>ISO</originator>
          <doc-type>IS</doc-type>
          <doc-number>9001</doc-number>
          <edition>1</edition>
          <part-number>1</part-number>
          <sub-part-number>a</sub-part-number>
          <sub-part-number>b</sub-part-number>
        </std-ident>
      XML

      parsed = described_class.from_xml(xml)
      expect(parsed.originator).to eq("ISO")
      expect(parsed.sub_part_number).to eq(%w[a b])

      generated = parsed.to_xml
      expect(generated).to be_xml_equivalent_to(xml)
    end
  end
end

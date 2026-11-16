# frozen_string_literal: true

require "spec_helper"
require "canon/rspec_matchers"

RSpec.describe Sts do
  # metanorma-iso's STS InlineTransformer walks a source's mixed content and
  # public_sends each inline element name onto the target model
  # (metanorma/metanorma-pdfa#122: a <tt> inside a def-list <dt> dispatched
  # `monospace` onto Sts::NisoSts::Term, which did not declare it —
  # NoMethodError, and the element was silently dropped on parse).
  #
  # These specs pin the dispatched inline set on every model the transformer
  # targets, and round-trip the newly added elements.
  describe Sts::NisoSts::Term do
    it "round-trips a term containing monospace (metanorma-pdfa#122)" do
      xml = "<term>voltage<monospace>V</monospace></term>"
      parsed = described_class.from_xml(xml)

      expect(parsed.monospace.map(&:content)).to eq([["V"]])
      expect(parsed.text).to eq(["voltage"])
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end

    it "round-trips a term containing sub, sup, sc and break" do
      xml = "<term>10<sup>3</sup> Hz range<sc>rf</sc><break/>end"
      parsed = described_class.from_xml(xml)

      expect(parsed.sup.map(&:content)).to eq([["3"]])
      expect(parsed.sc.map(&:content)).to eq([["rf"]])
      expect(parsed.break.first).to be_an(Sts::NisoSts::Break)
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end

    it "round-trips nested inline content inside sup" do
      xml = "<term>10<sup><sub>6</sub><sc>v</sc></sup></term>"
      parsed = described_class.from_xml(xml)

      expect(parsed.sup.first.sub.map(&:content)).to eq([["6"]])
      expect(parsed.sup.first.sc.map(&:content)).to eq([["v"]])
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end

    it "round-trips underline and styled-content inside a term" do
      xml = "<term><underline>u</underline>" \
            "<styled-content style-type=\"strong\">s</styled-content></term>"
      parsed = described_class.from_xml(xml)

      expect(parsed.underline.map(&:content)).to eq([["u"]])
      expect(parsed.styled_content.map(&:style_type)).to eq(["strong"])
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::Title do
    it "round-trips a title containing ext-link" do
      xml = "<title>see <ext-link xlink:href=\"https://example.com\">" \
            "the reference</ext-link></title>"
      parsed = described_class.from_xml(xml)

      expect(parsed.ext_link.map(&:href)).to eq(["https://example.com"])
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::Preformat do
    it "round-trips a preformat containing inline elements" do
      xml = "<preformat>resistor <xref rid=\"tab_1\">table</xref>" \
            "<sub>in</sub><break/>out</preformat>"
      parsed = described_class.from_xml(xml)

      expect(parsed.xref.map(&:rid)).to eq(["tab_1"])
      expect(parsed.sub.map(&:content)).to eq([["in"]])
      expect(parsed.break.first).to be_an(Sts::NisoSts::Break)
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::NisoSts::Sup do
    it "round-trips nested inline content inside sup" do
      xml = "<sup>10<sub>6</sub><ext-link xlink:href=\"https://example.com\">" \
            "l</ext-link></sup>"
      parsed = described_class.from_xml(xml)

      expect(parsed.sub.map(&:content)).to eq([["6"]])
      expect(parsed.ext_link.map(&:href)).to eq(["https://example.com"])
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::TbxIsoTml::Bold do
    it "round-trips std and break inside bold" do
      xml = "<bold>per <std><std-ref>ISO 1234</std-ref></std>" \
            "<break/>done</bold>"
      parsed = described_class.from_xml(xml)

      expect(parsed.std.map do |std|
        std.std_ref.map(&:value)
      end).to eq([["ISO 1234"]])
      expect(parsed.break.first).to be_an(Sts::NisoSts::Break)
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::TbxIsoTml::Italic do
    it "round-trips std and break inside italic" do
      xml = "<italic>see <std><std-ref>IEV 113</std-ref></std>" \
            "<break/>below</italic>"
      parsed = described_class.from_xml(xml)

      expect(parsed.std.map do |std|
        std.std_ref.map(&:value)
      end).to eq([["IEV 113"]])
      expect(parsed.break.first).to be_an(Sts::NisoSts::Break)
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::TbxIsoTml::Definition do
    it "round-trips sc and break inside a definition" do
      xml = "<tbx:definition xmlns:tbx=\"urn:iso:std:iso:30042:ed-1\">" \
            "<sc>ac</sc> current<break/>notes</tbx:definition>"
      parsed = described_class.from_xml(xml)

      expect(parsed.sc.map(&:content)).to eq([["ac"]])
      expect(parsed.break.first).to be_an(Sts::NisoSts::Break)
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::TbxIsoTml::Note do
    it "round-trips monospace and break inside a note" do
      xml = "<tbx:note xmlns:tbx=\"urn:iso:std:iso:30042:ed-1\">" \
            "use <monospace>set</monospace><break/>here</tbx:note>"
      parsed = described_class.from_xml(xml)

      expect(parsed.monospace.map(&:content)).to eq([["set"]])
      expect(parsed.break.first).to be_an(Sts::NisoSts::Break)
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end

  describe Sts::TbxIsoTml::Example do
    it "round-trips sub, sup and break inside an example" do
      xml = "<tbx:example xmlns:tbx=\"urn:iso:std:iso:30042:ed-1\">" \
            "10<sup>6</sup> Hz<sub>rms</sub><break/>end</tbx:example>"
      parsed = described_class.from_xml(xml)

      expect(parsed.sup.map(&:content)).to eq([["6"]])
      expect(parsed.sub.map(&:content)).to eq([["rms"]])
      expect(parsed.break.first).to be_an(Sts::NisoSts::Break)
      expect(parsed.to_xml).to be_xml_equivalent_to(xml)
    end
  end

  describe "dispatched inline accessor coverage" do
    it "responds to every dispatched inline accessor on models receiving " \
       "inline content" do
      dispatched = %i[
        bold italic sub sup monospace sc xref std ext_link break
        inline_formula styled_content
      ]
      targets = {
        Sts::NisoSts::Term => "def-list term",
        Sts::NisoSts::Title => "section title",
        Sts::NisoSts::Paragraph => "p",
        Sts::NisoSts::Preformat => "preformat (sourcecode)",
        Sts::NisoSts::Sup => "nested sup",
        Sts::NisoSts::StyledContent => "styled-content",
        Sts::TbxIsoTml::Bold => "bold",
        Sts::TbxIsoTml::Italic => "italic",
        Sts::TbxIsoTml::Definition => "tbx definition",
        Sts::TbxIsoTml::Note => "tbx note",
        Sts::TbxIsoTml::Example => "tbx example",
      }

      aggregate_failures do
        targets.each do |klass, context|
          missing = dispatched.reject { |e| klass.new.respond_to?(e) }
          next if missing.empty?

          message = "#{klass} missing #{missing.join(', ')} " \
                    "(#{context} receives inline content)"
          expect(missing).to(be_empty, message)
        end
      end
    end
  end
end

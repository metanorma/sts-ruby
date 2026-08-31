# frozen_string_literal: true

require "spec_helper"

RSpec.describe Sts::Profiles::IsoIec::Validator do
  let(:validator) { described_class.new }

  describe "#validate" do
    it "accepts a valid ISO standard document" do
      xml = <<~XML
        <standard>
          <front>
            <std-meta>
              <std-ident>
                <originator>ISO</originator>
                <doc-type>is</doc-type>
                <doc-number>9001</doc-number>
              </std-ident>
              <doc-ref>ISO 9001:2015(en)</doc-ref>
              <release-version>2015</release-version>
            </std-meta>
          </front>
          <body>
            <sec id="sec_1">
              <title>Scope</title>
              <p id="p_1">This standard covers quality management.</p>
            </sec>
          </body>
        </standard>
      XML

      doc = Sts::NisoSts::Standard.from_xml(xml)
      errors = validator.validate(doc)
      expect(errors).to be_empty
    end

    it "reports missing <front>" do
      xml = <<~XML
        <standard>
          <body>
            <sec id="s1"><title>Test</title></sec>
          </body>
        </standard>
      XML

      doc = Sts::NisoSts::Standard.from_xml(xml)
      errors = validator.validate(doc)
      expect(errors).to include(a_string_matching(/requires <front>/))
    end

    it "reports missing <body>" do
      xml = <<~XML
        <standard>
          <front>
            <std-meta>
              <std-ident>
                <originator>ISO</originator>
                <doc-type>is</doc-type>
                <doc-number>9001</doc-number>
              </std-ident>
            </std-meta>
          </front>
        </standard>
      XML

      doc = Sts::NisoSts::Standard.from_xml(xml)
      errors = validator.validate(doc)
      expect(errors).to include(a_string_matching(/requires <body>/))
    end

    it "reports missing std-ident children" do
      xml = <<~XML
        <standard>
          <front>
            <std-meta>
              <std-ident>
                <originator>ISO</originator>
              </std-ident>
            </std-meta>
          </front>
          <body>
            <sec id="s1"><title>Test</title></sec>
          </body>
        </standard>
      XML

      doc = Sts::NisoSts::Standard.from_xml(xml)
      errors = validator.validate(doc)
      expect(errors).to include(a_string_matching(/missing <doc-type>/))
      expect(errors).to include(a_string_matching(/missing <doc-number>/))
    end

    it "reports both missing front and body" do
      doc = Sts::NisoSts::Standard.from_xml("<standard/>")
      errors = validator.validate(doc)
      expect(errors.length).to eq(2)
      expect(errors).to include(a_string_matching(/requires <front>/))
      expect(errors).to include(a_string_matching(/requires <body>/))
    end

    it "reports unrecognized originator" do
      xml = <<~XML
        <standard>
          <front>
            <std-meta>
              <std-ident>
                <originator>UNKNOWN</originator>
                <doc-type>is</doc-type>
                <doc-number>1234</doc-number>
              </std-ident>
            </std-meta>
          </front>
          <body>
            <sec id="s1"><title>Test</title></sec>
          </body>
        </standard>
      XML

      doc = Sts::NisoSts::Standard.from_xml(xml)
      errors = validator.validate(doc)
      expect(errors).to include(
        a_string_matching(/not a recognized ISO\/IEC originator/),
      )
    end

    it "reports unrecognized document type" do
      xml = <<~XML
        <standard>
          <front>
            <std-meta>
              <std-ident>
                <originator>ISO</originator>
                <doc-type>unknown</doc-type>
                <doc-number>1234</doc-number>
              </std-ident>
            </std-meta>
          </front>
          <body>
            <sec id="s1"><title>Test</title></sec>
          </body>
        </standard>
      XML

      doc = Sts::NisoSts::Standard.from_xml(xml)
      errors = validator.validate(doc)
      expect(errors).to include(
        a_string_matching(/not a recognized ISO\/IEC document type/),
      )
    end
  end

  describe "#validate with an id scheme" do
    let(:xml) do
      <<~XML
        <standard>
          <front>
            <std-meta>
              <std-ident>
                <originator>ISO</originator>
                <doc-type>is</doc-type>
                <doc-number>9001</doc-number>
              </std-ident>
            </std-meta>
          </front>
          <body>
            <sec id="sec_1">
              <title>Scope</title>
              <fig id="fig_1"><label>1</label></fig>
            </sec>
          </body>
        </standard>
      XML
    end

    it "accepts ids following the selected scheme" do
      doc = Sts::NisoSts::Standard.from_xml(xml)
      errors = described_class.new(id_scheme: :iso).validate(doc)
      expect(errors).to be_empty
    end

    it "reports ids following the other organization's scheme" do
      doc = Sts::NisoSts::Standard.from_xml(xml)
      errors = described_class.new(id_scheme: :iec).validate(doc)

      expect(errors).to include(
        a_string_matching(/<sec> id 'sec_1' does not follow the iec/),
        a_string_matching(/<fig> id 'fig_1' does not follow the iec/),
      )
    end

    it "reaches ids nested below the top-level sections" do
      nested = <<~XML
        <standard>
          <front/>
          <body>
            <sec id="sec_1">
              <sec id="sec_1.1">
                <fig id="wrong-1"><label>1</label></fig>
              </sec>
            </sec>
          </body>
        </standard>
      XML

      doc = Sts::NisoSts::Standard.from_xml(nested)
      errors = described_class.new(id_scheme: :iso).validate(doc)

      expect(errors).to include(a_string_matching(/<fig> id 'wrong-1'/))
    end

    it "checks no ids when no scheme is selected" do
      doc = Sts::NisoSts::Standard.from_xml(xml)
      expect(described_class.new.validate(doc)).to be_empty
    end
  end
end

RSpec.describe Sts::Profiles::IsoIec::Constraints do
  it "defines required ID elements" do
    expect(described_class::REQUIRED_ID_ELEMENTS)
      .to include("sec", "fig", "app")
  end

  it "excludes the elements Annex F.2 says carry no id" do
    expect(described_class::REQUIRED_ID_ELEMENTS)
      .not_to include("p", "list", "graphic", "non-normative-note")
  end

  it "documents the committee reference formats" do
    expect(described_class::COMM_REF_EXAMPLES)
      .to eq("ISO" => "ISO/TC 126/SC 1", "IEC" => "TC 25")
  end

  it "defines standard originators" do
    expect(described_class::ORIGINATORS).to include("ISO", "IEC")
  end

  it "defines document types" do
    expect(described_class::DOCUMENT_TYPES).to include("is", "tr", "ts")
  end
end

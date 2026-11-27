# frozen_string_literal: true

require "spec_helper"

# NISO STS 1.2 content models for std-ident and disp-quote: the children
# must serialize in model order, or the output fails XSD validation. The
# IEC 616 conformance run found part-number after version (std-ident) and
# attribution where the model carries attrib (disp-quote).
RSpec.describe Sts::NisoSts::StandardIdentification do
  it "serializes std-ident as doc-number, part-number, edition, version" do
    std_ident = described_class.new(
      doc_number: "616", part_number: "1", edition: "2", version: "3",
    )

    names = Nokogiri::XML(std_ident.to_xml).root.element_children.map(&:name)
    expect(names).to eq(%w[doc-number part-number edition version])
  end

  describe Sts::NisoSts::DispQuote do
    it "serializes disp-quote's source as attrib after the paragraphs" do
      quote = described_class.new(
        paragraphs: [Sts::NisoSts::Paragraph.new(text: ["Quoted"])],
        attrib: [Sts::NisoSts::Attrib.new(specific_use: "source",
                                          content: ["ISO 7301"])],
      )

      doc = Nokogiri::XML(quote.to_xml)
      expect(doc.root.element_children.map(&:name)).to eq(%w[p attrib])
      expect(doc.at_xpath("//attrib")["specific-use"]).to eq("source")
    end
  end
end

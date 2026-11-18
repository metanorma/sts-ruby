# frozen_string_literal: true

require "spec_helper"

RSpec.describe Sts::NisoSts::Graphic do
  # NISO STS graphic-model carries the accessibility text as CHILD
  # ELEMENTS (<alt-text>, <long-desc> — access.class); the element has
  # no @alttext attribute in the NISO STS 1.2 XSD. The ISO STS HTML
  # renderer reads <alt-text> for the <img alt> attribute.
  it "parses the alt-text child element" do
    xml = '<graphic xmlns:xlink="http://www.w3.org/1999/xlink" ' \
          'xlink:href="figure-1.png">' \
          "<alt-text>Overall schematic</alt-text></graphic>"
    graphic = described_class.from_xml(xml)

    expect(graphic.href.to_s).to eq("figure-1.png")
    expect(Array(graphic.alt_text).first.content).to eq(["Overall schematic"])
  end

  it "round-trips the alt-text child element" do
    xml = '<graphic xmlns:xlink="http://www.w3.org/1999/xlink" ' \
          'xlink:href="figure-1.png">' \
          "<alt-text>Overall schematic</alt-text></graphic>"
    graphic = described_class.from_xml(xml)

    expect(graphic.to_xml).to include("figure-1.png")
    expect(graphic.to_xml).to include("Overall schematic")
  end

  it "carries no alttext attribute (not in the NISO STS 1.2 model)" do
    expect(described_class.attributes.key?(:alttext)).to be(false)
    expect(described_class.attributes.key?(:alt_text)).to be(true)
    expect(described_class.attributes.key?(:long_desc)).to be(true)
  end
end

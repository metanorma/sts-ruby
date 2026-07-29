# frozen_string_literal: true

require "spec_helper"

# Validates IsoSts model output against the canonical ISOSTS.xsd. Round-trip
# specs alone cannot catch attribute-set drift (a model that invents or
# drops an attribute still round-trips symmetrically); XSD validation is
# the only authoritative check.
module SchemaValidationFixtures
  SIMPLE_VALID_XML = {
    year_min: "<year>2024</year>",
    year_full: '<year content-type="published" specific-use="v" xml:lang="en">2024</year>',
    volume_full: '<volume content-type="issue" seq="1" specific-use="v" xml:lang="en">42</volume>',
    fpage_full: '<fpage content-type="electronic" seq="1" specific-use="v" xml:lang="en">1</fpage>',
    lpage_full: '<lpage content-type="electronic" specific-use="v" xml:lang="en">42</lpage>',
    day_full: '<day content-type="published" specific-use="v" xml:lang="en">15</day>',
    month_full: '<month content-type="published" specific-use="v" xml:lang="en">6</month>',
    season_full: '<season content-type="published" specific-use="v" xml:lang="en">Summer</season>',
  }.freeze
end

RSpec.describe Sts::IsoSts do
  def validate(xml_fragment)
    StsSchemas.errors(StsSchemas.isosts, xml_fragment)
  end

  describe "simple text-with-attrs elements validate against ISOSTS.xsd" do
    SchemaValidationFixtures::SIMPLE_VALID_XML.each do |name, xml|
      it "#{name} validates" do
        expect(validate(xml)).to be_empty
      end
    end
  end

  describe "IsoSts round-trip output validates against ISOSTS.xsd" do
    it "Year round-trip is schema-conformant" do
      original = SchemaValidationFixtures::SIMPLE_VALID_XML[:year_full]
      serialised = described_class::Year.to_xml(described_class::Year.from_xml(original))
      expect(validate(serialised)).to be_empty
    end

    it "Volume round-trip is schema-conformant" do
      original = SchemaValidationFixtures::SIMPLE_VALID_XML[:volume_full]
      serialised = described_class::Volume.to_xml(described_class::Volume.from_xml(original))
      expect(validate(serialised)).to be_empty
    end

    it "CustomMeta round-trip is schema-conformant" do
      original = <<~XML
        <custom-meta id="cm-1" specific-use="testing">
          <meta-name>key</meta-name>
          <meta-value>value</meta-value>
        </custom-meta>
      XML
      serialised = described_class::CustomMeta.to_xml(described_class::CustomMeta.from_xml(original))
      expect(validate(serialised)).to be_empty
    end
  end
end

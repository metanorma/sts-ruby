# frozen_string_literal: true

require "spec_helper"

RSpec.describe Sts::Profiles do
  describe ".validator" do
    it "returns the ISO/IEC validator" do
      expect(described_class.validator(:iso_iec))
        .to be_a(Sts::Profiles::IsoIec::Validator)
    end

    it "accepts a known id scheme" do
      expect(described_class.validator(:iso_iec, id_scheme: :iec))
        .to be_a(Sts::Profiles::IsoIec::Validator)
    end

    it "raises for an unknown profile" do
      expect { described_class.validator(:bsi) }
        .to raise_error(Sts::Profiles::UnknownProfileError, /:bsi/)
    end

    it "raises for an unknown id scheme" do
      expect { described_class.validator(:iso_iec, id_scheme: :din) }
        .to raise_error(ArgumentError, /:din/)
    end

    # Only nil opts out. Anything else falsy is a caller mistake, and
    # silently skipping the check would hide it.
    it "raises for a false id scheme rather than skipping the check" do
      expect { described_class.validator(:iso_iec, id_scheme: false) }
        .to raise_error(ArgumentError, /false/)
    end

    it "leaves ids unchecked by default" do
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
          <body><sec id="totally-arbitrary"><title>Scope</title></sec></body>
        </standard>
      XML

      doc = Sts::NisoSts::Standard.from_xml(xml)
      expect(described_class.validator(:iso_iec).validate(doc)).to be_empty
    end
  end
end

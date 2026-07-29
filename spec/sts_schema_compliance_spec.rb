# frozen_string_literal: true

require "spec_helper"

# Round-trip specs prove the gem preserves what it read. They cannot prove the
# result is a legal STS document — a model that consistently drops or reorders
# an element round-trips symmetrically and still produces something no schema
# accepts. These specs validate whole documents against the vendored schemas.
#
# Fragment-level ISOSTS validation lives in
# spec/iso_sts/schema_validation_spec.rb.
#
# NISO STS Interchange and NISO STS 1.2 are not covered because neither schema
# is vendored under reference-docs/.
RSpec.describe Sts do
  shared_examples "a schema-valid document" do |fixture:, model:|
    let(:source) { File.read(fixtures_path(fixture)) }

    it "ships a fixture that validates" do
      expect(StsSchemas.errors(validator, source)).to be_empty
    end

    it "re-serializes to a document that still validates" do
      generated = model.from_xml(source).to_xml(
        pretty: true,
        declaration: true,
        encoding: "utf-8",
      )

      expect(StsSchemas.errors(validator, generated)).to be_empty
    end
  end

  describe "NISO STS 1.0 extended (MathML 3)" do
    let(:validator) { StsSchemas.niso_sts }

    it_behaves_like "a schema-valid document",
                    fixture: "ISO_13849-1_2008-12_en_TBX.xml",
                    model: Sts::NisoSts::Standard

    it_behaves_like "a schema-valid document",
                    fixture: "DIN_EN_ISO_13849-1_2008-12_en_TBX.xml",
                    model: Sts::NisoSts::Adoption
  end

  describe "ISOSTS v1.1" do
    let(:validator) { StsSchemas.isosts }

    it_behaves_like "a schema-valid document",
                    fixture: "iso_sts/feature_doc.xml",
                    model: Sts::IsoSts::Standard

    # Invalid as shipped: around line 618 a <mml:semantics> wraps presentation
    # children with no <mml:annotation>, which MathML 2 (imported by
    # ISOSTS.xsd) forbids. The raw fixture and the round-tripped output report
    # the identical error at the same element, so this is a defect in the
    # fixture rather than corruption introduced by the model.
    describe "tbx-nisosts-0.2.xml",
             pending: "fixture has an invalid <mml:semantics> content model" do
      it_behaves_like "a schema-valid document",
                      fixture: "tbx-nisosts-0.2.xml",
                      model: Sts::IsoSts::Standard
    end
  end
end

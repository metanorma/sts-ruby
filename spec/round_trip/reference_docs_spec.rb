# frozen_string_literal: true

require "spec_helper"
require "canon/rspec_matchers"

REFERENCE_DOCS_PATH = File.expand_path(
  "../fixtures/mn-samples-iso-private/reference-docs",
  __dir__,
)

# Files that currently fail round-trip due to model gaps
PENDING_FILES = %w[
  iso_std_iso_10303-22_ed-1_v1_en.xml
].freeze

RSpec.describe "Reference document round-trips" do
  reference_docs = Dir.glob(File.join(REFERENCE_DOCS_PATH, "**", "*.xml"))

  reference_docs.each do |file|
    basename = File.basename(file)
    content = File.read(file)
    is_iso_sts = content.include?("<iso-meta")
    standard_class = is_iso_sts ? Sts::IsoSts::Standard : Sts::NisoSts::Standard
    sts_format = is_iso_sts ? "ISO STS" : "NISO STS"

    describe "#{basename} (#{sts_format})" do
      let(:doc) { content }

      it "parses without error" do
        expect { standard_class.from_xml(doc) }.not_to raise_error
      end

      it "round-trips without data loss" do
        pending "model gaps — see TODO.roundtrip.md" if PENDING_FILES.include?(basename)

        parsed = standard_class.from_xml(doc)
        generated = parsed.to_xml(
          pretty: true,
          declaration: true,
          encoding: "utf-8",
        )

        # Strip processing instructions — lutaml-model drops them during parse
        # Preserve XML declaration (<?xml ...?>) — only strip actual PIs
        original = doc.gsub(/<\?(?!xml)[^?]*\?>/, "")

        expect(generated).to be_xml_equivalent_to(original)
      end
    end
  end
end

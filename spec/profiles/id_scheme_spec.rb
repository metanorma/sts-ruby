# frozen_string_literal: true

require "spec_helper"

RSpec.describe Sts::Profiles::IsoIec::IdScheme do
  describe "#violation" do
    it "accepts an id carrying the ISO prefix" do
      expect(described_class.new(:iso).violation("fig", "fig_1")).to be_nil
    end

    it "accepts an ISO id behind a document identifier" do
      scheme = described_class.new(:iso)
      expect(scheme.violation("fig", "iso_10993-1_2009_en_fig_1")).to be_nil
    end

    it "rejects an IEC-style id under the ISO scheme" do
      expect(described_class.new(:iso).violation("fig", "fig-1"))
        .to match(/does not follow the iso ID scheme.*fig_/)
    end

    it "accepts an id carrying the IEC prefix" do
      expect(described_class.new(:iec).violation("disp-formula", "for-c.1"))
        .to be_nil
    end

    it "uses the per-element prefix, not one prefix for the document" do
      scheme = described_class.new(:iec)
      expect(scheme.violation("term-sec", "con-3.1.3")).to be_nil
      expect(scheme.violation("term-sec", "sec-3.1.3")).not_to be_nil
    end

    it "does not check elements the scheme does not cover" do
      expect(described_class.new(:iso).violation("p", "par-1-1")).to be_nil
    end

    it "raises for an unknown scheme name" do
      expect { described_class.new(:din) }
        .to raise_error(ArgumentError, /:din/)
    end
  end

  # Annex F of the Coding Guidelines documents these schemes as legacy, and
  # warns that ids produced by OSD are arbitrary. These examples pin what the
  # reference documents in this repository actually do, so the prefixes stay
  # grounded in real files rather than in the annex alone.
  describe "conformance of the reference documents" do
    def violations(file, scheme_name)
      scheme = described_class.new(scheme_name)

      covered_nodes(file, scheme_name).transform_values do |nodes|
        nodes.count { |node| scheme.violation(node.name, node["id"]) }
      end
    end

    def covered_nodes(file, scheme_name)
      covered = described_class::SCHEMES.fetch(scheme_name)

      Moxml.new.parse(File.read(file)).xpath("//*[@id]")
        .select { |node| covered.key?(node.name) }
        .group_by(&:name)
    end

    it "finds the ISOSTS reference example fully ISO-conformant" do
      counts = violations(
        "reference-docs/isosts-example/feature_doc.xml", :iso
      )

      expect(counts).to eq("sec" => 0, "fig" => 0, "disp-formula" => 0)
    end

    it "finds ISO 13849-1 IEC-conformant except for sec and term-sec" do
      counts = violations(
        "spec/fixtures/ISO_13849-1_2008-12_en_TBX.xml", :iec
      )

      expect(counts).to eq(
        "fig" => 0, "table-wrap" => 0, "disp-formula" => 0,
        "sec" => 96, "term-sec" => 37
      )
    end
  end
end

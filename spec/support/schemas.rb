# frozen_string_literal: true

require "nokogiri"

# Schema validators for the spec suite.
#
# The compiled schemas are memoised per process rather than per example:
# ISOSTS.xsd costs ~0.5s to compile and the NISO extended XSD ~2.4s, which is
# far too slow to repeat in a `let`.
module StsSchemas
  REFERENCE_DOCS = File.expand_path("../../reference-docs", __dir__)

  NISO_STS_PATH = File.join(
    REFERENCE_DOCS,
    "NISO-STS-extended-1-MathML3-XSD",
    "NISO-STS-extended-1-mathml3.xsd",
  )
  ISOSTS_PATH = File.join(REFERENCE_DOCS, "isosts-v1", "xsd", "ISOSTS.xsd")

  class << self
    def niso_sts
      @niso_sts ||= compile(NISO_STS_PATH)
    end

    def isosts
      @isosts ||= compile(ISOSTS_PATH)
    end

    # Returns messages rather than Nokogiri::XML::SyntaxError objects so that a
    # failing `expect(...).to be_empty` prints something actionable.
    #
    # The explicit "UTF-8" is load-bearing. tbx-nisosts-0.2.xml carries no XML
    # declaration, and without it libxml leaves doc.encoding nil and then
    # rejects the id "iso_std_iso_3951_-2_ed-1_en_term_3.10·1" with "Syntax of
    # value for attribute id". U+00B7 is a legal XML NameChar — that error is
    # purely an encoding artifact, not a defect in the document.
    #
    # Parsing is strict because libxml's default recovery mode repairs damage
    # before the schema ever sees it — an unclosed `<year>2024` validates clean
    # once recovered. Output mangled that badly has to fail, not pass.
    def errors(schema, xml)
      document = Nokogiri::XML(xml, nil, "UTF-8") do |config|
        config.strict.nonet
      end

      schema.validate(document).map { |error| error.message.strip }
    rescue Nokogiri::XML::SyntaxError => e
      [e.message.strip]
    end

    private

    # Passing the path as the document URL is what lets libxml resolve the
    # relative xs:import/xs:include hrefs (ncbi-mathml2/, xlink.xsd, xml.xsd,
    # tbx.xsd), so no caller has to Dir.chdir into the schema directory.
    # Strict for the same reason `errors` is: a truncated XSD parsed in
    # recovery mode still compiles, and then validates every document clean.
    # A corrupt schema has to blow up here rather than pass everything.
    def compile(path)
      document = Nokogiri::XML(File.read(path), path) do |config|
        config.strict.nonet
      end

      Nokogiri::XML::Schema.from_document(document)
    end
  end
end

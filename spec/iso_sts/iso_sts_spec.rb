# frozen_string_literal: true

RSpec.describe Sts::IsoSts do
  let(:feature_doc_file) do
    File.join(fixtures_path, "iso_sts", "feature_doc.xml")
  end

  it "parses feature_doc.xml" do
    doc = File.read(feature_doc_file)
    Sts::IsoSts::Standard.from_xml(doc)
  end

  it "round-trips feature_doc.xml" do
    doc = File.read(feature_doc_file)
    parsed = Sts::IsoSts::Standard.from_xml(doc)
    generated = parsed.to_xml(
      pretty: true,
      declaration: true,
      encoding: "utf-8",
    )

    expect(generated).to be_xml_equivalent_to(doc)
  end
end

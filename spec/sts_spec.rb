# frozen_string_literal: true

RSpec.describe Sts do
  it "has a version number" do
    expect(Sts::VERSION).not_to be nil
  end

  let(:tbx_example_file) do
    File.join(fixtures_path, "tbx-nisosts-0.2.xml")
  end

  let(:tbx_example_file_formatted) do
    File.join(fixtures_path, "tbx-nisosts-0.2-formatted.xml")
  end

  let(:iso_sts_example_file_formatted) do
    File.join(fixtures_path, "ISO_13849-1_2008-12_en_TBX.xml")
  end

  let(:din_iso_sts_example_file_formatted) do
    File.join(fixtures_path, "DIN_EN_ISO_13849-1_2008-12_en_TBX.c14n.xml")
  end

  it "parses TBX-ISO-TML example file" do
    doc = File.read(tbx_example_file)
    Sts::NisoSts::Standard.from_xml(doc)
  end

  it "round-trips TBX-ISO-TML example file" do
    doc = File.read(tbx_example_file_formatted)
    parsed = Sts::NisoSts::Standard.from_xml(doc)
    generated = parsed.to_xml(
      pretty: true,
      declaration: true,
      encoding: "utf-8",
    )

    expect(generated).to be_analogous_with(doc)
  end

  it "parses ISO 13849-1:2008-12 file" do
    doc = File.read(iso_sts_example_file_formatted)
    Sts::NisoSts::Standard.from_xml(doc)
  end

  it "round-trips ISO 13849-1:2008-12 file" do
    doc = File.read(iso_sts_example_file_formatted)
    parsed = Sts::NisoSts::Standard.from_xml(doc)
    generated = parsed.to_xml(
      pretty: true,
      declaration: true,
      encoding: "utf-8",
    )

    expect(generated).to be_analogous_with(doc)
  end

  it "parses DIN EN ISO 13849-1:2008-12 file" do
    doc = File.read(din_iso_sts_example_file_formatted)
    Sts::NisoSts::Adoption.from_xml(doc)
  end

  it "round-trips DIN EN ISO 13849-1:2008-12 file" do
    doc = File.read(din_iso_sts_example_file_formatted)
    parsed = Sts::NisoSts::Adoption.from_xml(doc)
    generated = parsed.to_xml(
      pretty: true,
      declaration: true,
      encoding: "utf-8",
    )

    expect(generated).to be_analogous_with(doc)
  end
end

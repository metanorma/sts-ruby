# frozen_string_literal: true

RSpec.describe Sts do
  it "has a version number" do
    expect(Sts::VERSION).not_to be nil
  end

  let(:tbx_example_file) {
    File.join(fixtures_path, "tbx-nisosts-0.2.xml")
  }
  let(:tbx_example_file_formatted) {
    File.join(fixtures_path, "tbx-nisosts-0.2-formatted.xml")
  }

  it "parses TBX-ISO-TML example file" do
    doc = IO.read(tbx_example_file)
    Sts::NisoSts::Standard.from_xml(doc)
  end

  it "round-trips TBX-ISO-TML example file" do
    doc = IO.read(tbx_example_file_formatted)
    generated = Sts::NisoSts::Standard.from_xml(doc).to_xml(pretty: true)
    # puts generated
    expect(generated).to be_equivalent_to(doc)
  end
end

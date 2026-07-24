# frozen_string_literal: true

require "spec_helper"

# ISOSTS imports ncbi-mathml2 (reference-docs/isosts-v1/xsd/ncbi-mathml2/) and
# uses the MathML 2 DTD (reference-docs/isosts-v1/mathml2.dtd). NISO STS uses
# MathML 3 (reference-docs/NISO-STS-extended-1-MathML3-XSD/). TBX-in-ISOSTS is
# the only TBX context used in this gem (no NisoSts reference to TBX math
# elements), so TBX math-bearing elements also bind to V2.
#
# Round-tripping cannot prove this: a model that retypes math to V3 still
# parses and serialises symmetrically. These specs assert the exact type so
# future refactors that drift back to V3 fail loudly.
RSpec.describe "MathML host version binding" do
  describe Sts::IsoSts do
    {
      InlineFormula: :math,
      DispFormula: :math,
      Paragraph: :math,
      Td: :math,
      Th: :math,
      Term: :math,
    }.each do |model_name, attr|
      it "##{model_name}##{attr} is Mml::V2::Math" do
        klass = described_class.const_get(model_name)
        expect(klass.attributes[attr].type).to eq(Mml::V2::Math)
      end
    end
  end

  describe Sts::TbxIsoTml do
    {
      Note: :math,
      Term: :math,
      Definition: :math,
    }.each do |model_name, attr|
      it "##{model_name}##{attr} is Mml::V2::Math" do
        klass = described_class.const_get(model_name)
        expect(klass.attributes[attr].type).to eq(Mml::V2::Math)
      end
    end
  end

  describe Sts::NisoSts do
    {
      InlineFormula: :math,
      DisplayFormula: :math,
    }.each do |model_name, attr|
      it "##{model_name}##{attr} is Mml::V3::Math" do
        klass = described_class.const_get(model_name)
        expect(klass.attributes[attr].type).to eq(Mml::V3::Math)
      end
    end

    {
      "TbxIsoTml::Note" => "TBX-in-ISOSTS only",
      "TbxIsoTml::Term" => "TBX-in-ISOSTS only",
      "TbxIsoTml::Definition" => "TBX-in-ISOSTS only",
    }.each do |class_ref, scope|
      it "does not reference #{class_ref} (#{scope})" do
        niso_sts_dir = File.expand_path("../lib/sts/niso_sts", __dir__)
        grep_output = `grep -rl '#{class_ref}\\b' #{niso_sts_dir}`.strip
        expect(grep_output).to be_empty,
                               "NisoSts should not reference #{class_ref}; " \
                               "found in: #{grep_output}"
      end
    end
  end
end

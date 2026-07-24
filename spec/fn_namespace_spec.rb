# frozen_string_literal: true

require "spec_helper"

# `<fn>` and `<fn-group>` are JATS / NISO STS elements. They are not defined by
# TBX-ISO-TML (ISO 30042). Sts::TbxIsoTml::Fn / FnGroup were duplicates of the
# NisoSts equivalents with a conflicting Ruby attribute name (`:p` vs
# `:paragraph`) that caused NoMethodError when nested across namespaces — see
# TODO.finalize/00-overview.md and memory duplicate-fn-class-attribute-mismatch.
#
# These specs lock the deduplication in: TbxIsoTml::Fn must stay gone, IsoSts
# must use its own Fn (namespace independence), TbxIsoTml call sites follow the
# existing Bold/Italic precedent (NisoSts::Fn).
RSpec.describe "Fn/FnGroup namespace allocation" do
  describe Sts::TbxIsoTml do
    it "does not define Fn" do
      expect(described_class).not_to be_const_defined(:Fn)
    end

    it "does not define FnGroup" do
      expect(described_class).not_to be_const_defined(:FnGroup)
    end

    it "lib/sts/tbx_iso_tml/ contains no Fn class file" do
      tbx_dir = File.expand_path("../lib/sts/tbx_iso_tml", __dir__)
      fn_files = Dir.glob("fn*.rb", base: tbx_dir)
      expect(fn_files).to be_empty
    end

    it "no TbxIsoTml file references TbxIsoTml::Fn" do
      tbx_dir = File.expand_path("../lib/sts/tbx_iso_tml", __dir__)
      grep_output = `grep -rl 'TbxIsoTml::Fn\\b' #{tbx_dir}`.strip
      expect(grep_output).to be_empty,
                             "TbxIsoTml must not reference TbxIsoTml::Fn; " \
                             "found in: #{grep_output}"
    end

    it "no TbxIsoTml file references TbxIsoTml::FnGroup" do
      tbx_dir = File.expand_path("../lib/sts/tbx_iso_tml", __dir__)
      grep_output = `grep -rl 'TbxIsoTml::FnGroup\\b' #{tbx_dir}`.strip
      expect(grep_output).to be_empty,
                             "TbxIsoTml must not reference TbxIsoTml::" \
                             "FnGroup; found in: #{grep_output}"
    end
  end

  describe Sts::IsoSts do
    it "no IsoSts file references TbxIsoTml::Fn" do
      iso_sts_dir = File.expand_path("../lib/sts/iso_sts", __dir__)
      grep_output = `grep -rl 'TbxIsoTml::Fn\\b' #{iso_sts_dir}`.strip
      expect(grep_output).to be_empty,
                             "IsoSts must not reference TbxIsoTml::Fn; " \
                             "found in: #{grep_output}"
    end

    it "no IsoSts file references TbxIsoTml::FnGroup" do
      iso_sts_dir = File.expand_path("../lib/sts/iso_sts", __dir__)
      grep_output = `grep -rl 'TbxIsoTml::FnGroup\\b' #{iso_sts_dir}`.strip
      expect(grep_output).to be_empty,
                             "IsoSts must not reference TbxIsoTml::" \
                             "FnGroup; found in: #{grep_output}"
    end
  end

  describe Sts::NisoSts::Back do
    # Reproduces the structure of the original user bug report, but with the
    # now-correct types. Before the fix this raised
    # NoMethodError: undefined method 'paragraph' for an instance of
    # Sts::TbxIsoTml::Fn. After the fix (TbxIsoTml::Fn deleted) this is the
    # only way to express the structure — and it works.
    it "serializes nested fn-group/fn without raising" do
      paragraph = Sts::NisoSts::Paragraph.new
      paragraph.text = "First note."

      label = Sts::NisoSts::Label.new
      label.content = "1"

      fn = Sts::NisoSts::Fn.new
      fn.id = "fn1"
      fn.label = label
      fn.paragraph = [paragraph]

      group = Sts::NisoSts::FnGroup.new
      group.fn = [fn]

      back = described_class.new
      back.fn_group = [group]

      xml = back.to_xml
      expect(xml).to include("<fn-group")
      expect(xml).to include("<fn id=\"fn1\"")
      expect(xml).to include("<p>")
    end
  end
end

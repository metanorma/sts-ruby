# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Anti-patterns" do
  lib_dir = File.expand_path("../lib", __dir__)
  rb_files = Dir.glob(File.join(lib_dir, "**", "*.rb"))

  rb_files.each do |path|
    rel = path.sub("#{lib_dir}/", "")
    source = File.read(path)

    describe rel do
      it "has no method_missing" do
        msg = "#{rel}: method_missing forbidden"
        expect(source).not_to include("method_missing"), msg
      end

      it "has no respond_to_missing?" do
        msg = "#{rel}: respond_to_missing? forbidden"
        expect(source).not_to include("respond_to_missing?"), msg
      end

      it "has no Object.const_get" do
        msg = "#{rel}: Object.const_get forbidden"
        expect(source).not_to include("Object.const_get"), msg
      end

      it "has no .send()" do
        msg = "#{rel}: .send() forbidden"
        expect(source).not_to match(/\.send\(/), msg
      end
    end
  end
end

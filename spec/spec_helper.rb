# frozen_string_literal: true

require "sts"
require "rspec/matchers"
require "canon"

Bundler.require(:development)

Dir["./spec/support/**/*.rb"].sort.each { |file| require file }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

require "lutaml/model"
Lutaml::Model::Config.configure do |config|
  config.xml_adapter_type = :nokogiri
end

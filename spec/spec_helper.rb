# frozen_string_literal: true

if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.start do
    add_filter "/spec/"
    add_filter "/vendor/"
    enable_coverage :branch
    minimum_coverage 80
  end
end

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

# Configure Canon for XML comparison to ignore comments and use spec-friendly profile
# This makes comparisons more tolerant of formatting differences
Canon::Config.configure do |config|
  config.xml.match.profile = :spec_friendly
  config.xml.match.options = { comments: :ignore }
  config.xml.diff.algorithm = :semantic
  config.xml.diff.max_node_count = 50_000
end

# frozen_string_literal: true

require_relative "sts/version"
require "lutaml/model"
require "lutaml/model/xml_adapter/nokogiri_adapter"

module Sts
  Lutaml::Model::Config.configure do |config|
    config.xml_adapter = Lutaml::Model::XmlAdapter::NokogiriAdapter
  end

  class Error < StandardError; end

  # Your code goes here...
end

require_relative "sts/tbx_iso_tml"
require_relative "sts/mapper"
require_relative "sts/niso_sts"

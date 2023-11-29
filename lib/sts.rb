# frozen_string_literal: true

require_relative "sts/version"
require "shale"
require "shale/adapter/nokogiri"

module Sts
  Shale.xml_adapter = Shale::Adapter::Nokogiri

  class Error < StandardError; end
  # Your code goes here...
end

require_relative "sts/tbx_iso_tml"
require_relative "sts/niso_sts"

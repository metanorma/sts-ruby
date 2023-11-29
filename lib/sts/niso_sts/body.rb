# frozen_string_literal: true

require "shale"

require_relative "section"

module Sts
  module NisoSts
    class Body < Shale::Mapper
      attribute :sec, Section, collection: true

      xml do
        root "body"
        map_element "sec", to: :sec
      end
    end
  end
end

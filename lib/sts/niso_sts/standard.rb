# frozen_string_literal: true

require "shale"

require_relative "front"
require_relative "body"
require_relative "back"

module Sts
  module NisoSts
    class Standard < Shale::Mapper
      attribute :front, Front
      attribute :body, Body
      attribute :back, Back

      xml do
        root "standard"
        map_element "front", to: :front
        map_element "body", to: :body
        map_element "back", to: :back
      end
    end
  end
end

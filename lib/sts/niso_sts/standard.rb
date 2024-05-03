# frozen_string_literal: true

require "shale"

require_relative "front"
require_relative "body"
require_relative "back"

module Sts
  module NisoSts
    class Standard < Sts::Mapper
      attribute :front, Front
      attribute :body, Body
      attribute :back, Back
      attribute :id, Shale::Type::String
      attribute :lang, Shale::Type::String
      attribute :mml, Shale::Type::String
      attribute :tbx, Shale::Type::String
      attribute :xlink, Shale::Type::String

      xml do
        root "standard"
        # namespace "urn:iso:std:iso:30042:ed-1", "tbx"
        # namespace "http://www.w3.org/1998/Math/MathML", "mml"
        # namespace "http://www.w3.org/1999/xlink", "xlink"

        map_attribute "id", to: :id
        map_attribute "lang", to: :lang,
                              namespace: "http://www.w3.org/XML/1998/namespace",
                              prefix: "xml"
        map_element "front", to: :front
        map_element "body", to: :body
        map_element "back", to: :back
      end
    end
  end
end

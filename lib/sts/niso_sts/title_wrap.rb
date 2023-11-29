# frozen_string_literal: true

require "shale"

require_relative "reference_list"

module Sts
  module NisoSts
    class TitleWrap < Shale::Mapper
      attribute :main, Shale::Type::String
      attribute :full, Shale::Type::String
      attribute :lang, Shale::Type::String

      xml do
        root "title-wrap"
        map_attribute "lang", to: :lang,
                              namespace: "http://www.w3.org/XML/1998/namespace",
                              prefix: "xml"

        map_element "main", to: :main
        map_element "full", to: :full
      end
    end
  end
end

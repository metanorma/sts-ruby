# frozen_string_literal: true

require_relative "../mapper"

require_relative "reference_list"

module Sts
  module NisoSts
    class TitleWrap < Sts::Mapper
      attribute :intro, Shale::Type::String
      attribute :main, Shale::Type::String
      attribute :full, Shale::Type::String
      attribute :compl, Shale::Type::String
      attribute :lang, Shale::Type::String

      xml do
        root "title-wrap"
        map_attribute "lang", to: :lang,
                              namespace: "http://www.w3.org/XML/1998/namespace",
                              prefix: "xml"

        map_element "intro", to: :intro
        map_element "main", to: :main
        map_element "full", to: :full
        map_element "compl", to: :compl
      end
    end
  end
end

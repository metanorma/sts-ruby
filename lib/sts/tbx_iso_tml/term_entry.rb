# frozen_string_literal: true

require_relative "../mapper"

require_relative "lang_set"
require_relative "external_graphic"

module Sts
  module TbxIsoTml
    class TermEntry < Sts::Mapper
      attribute :id, Shale::Type::String
      attribute :lang_set, LangSet, collection: true
      attribute :x_graphic, ExternalGraphic, collection: true

      xml do
        root "termEntry"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "id", to: :id
        map_element "langSet", to: :lang_set
        map_element "xGraphic", to: :x_graphic
      end
    end
  end
end

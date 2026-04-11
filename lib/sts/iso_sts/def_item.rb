# frozen_string_literal: true

module Sts
  module IsoSts
    class DefItem < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :term, ::Sts::IsoSts::Term
      attribute :def, ::Sts::IsoSts::Def

      xml do
        element "def-item"

        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_element "term", to: :term
        map_element "def", to: :def
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module IsoSts
    class InlineFormula < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :math, Mml::V3::Math
      attribute :bold, ::Sts::IsoSts::Bold
      attribute :italic, ::Sts::IsoSts::Italic
      attribute :inline_formula, ::Sts::IsoSts::InlineFormula

      xml do
        element "inline-formula"

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_element "math", to: :math
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "inline-formula", to: :inline_formula
      end
    end
  end
end

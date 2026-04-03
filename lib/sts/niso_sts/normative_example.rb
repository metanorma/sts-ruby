# frozen_string_literal: true

module Sts
  module NisoSts
    class NormativeExample < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :xml_lang, :string
      attribute :specific_use, :string
      attribute :symbol, :string
      attribute :p, ::Sts::NisoSts::Paragraph
      attribute :label, ::Sts::NisoSts::Label

      xml do
        element "normative-example"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "specific-use", to: :specific_use
        map_attribute "symbol", to: :symbol

        map_element "p", to: :p
        map_element "label", to: :label
      end
    end
  end
end

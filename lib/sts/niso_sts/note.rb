# frozen_string_literal: true

module Sts
  module NisoSts
    class Note < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :xml_lang, :string
      attribute :specific_use, :string
      attribute :symbol, :string
      attribute :p, ::Sts::NisoSts::Paragraph, collection: true
      attribute :label, ::Sts::NisoSts::Label

      xml do
        element "note"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "specific-use", to: :specific_use
        map_attribute "symbol", to: :symbol

        map_element "p", to: :p
        map_element "label", to: :label
      end
    end
  end
end

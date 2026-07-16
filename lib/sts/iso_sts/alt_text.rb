# frozen_string_literal: true

module Sts
  module IsoSts
    class AltText < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string

      xml do
        element "alt-text"

        map_content to: :content
        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module NisoSts
    class LongDesc < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :xml_lang, :string
      attribute :specific_use, :string
      attribute :content, :string, collection: true
      xml do
        element "long-desc"
        map_attribute "id", to: :id
        mixed_content

        map_attribute "content-type", to: :content_type
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "specific-use", to: :specific_use
        map_content to: :content
      end
    end
  end
end

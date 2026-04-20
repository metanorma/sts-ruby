# frozen_string_literal: true

module Sts
  module NisoSts
    class SeeAlso < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      attribute :content_type, :string
      attribute :id, :string
      attribute :rid, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string

      xml do
        element "see-also"
        mixed_content

        map_content to: :content
        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "rid", to: :rid
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
      end
    end
  end
end

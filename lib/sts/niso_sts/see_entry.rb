# frozen_string_literal: true

module Sts
  module NisoSts
    class SeeEntry < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :rid, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true

      xml do
        element "see-entry"
        mixed_content

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "rid", to: :rid
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_content to: :content
      end
    end
  end
end

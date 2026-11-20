# frozen_string_literal: true

module Sts
  module NisoSts
    class SeriesText < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      attribute :named_content, ::Sts::NisoSts::NamedContent,
                collection: true
      attribute :target, ::Sts::NisoSts::Target,
                collection: true
      xml do
        element "series-text"
        map_attribute "id", to: :id
        mixed_content

        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_content to: :content
        map_element "named-content", to: :named_content
        map_element "target", to: :target
      end
    end
  end
end

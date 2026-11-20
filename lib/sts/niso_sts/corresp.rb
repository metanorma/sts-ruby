# frozen_string_literal: true

module Sts
  module NisoSts
    class Corresp < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      attribute :named_content, ::Sts::NisoSts::NamedContent,
                collection: true
      attribute :target, ::Sts::NisoSts::Target,
                collection: true
      xml do
        element "corresp"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "xml:lang", to: :xml_lang
        map_content to: :content
        map_element "named-content", to: :named_content
        map_element "target", to: :target
      end
    end
  end
end

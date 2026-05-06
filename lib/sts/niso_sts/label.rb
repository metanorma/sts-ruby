# frozen_string_literal: true

module Sts
  module NisoSts
    class Label < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      attribute :sup, Sts::TbxIsoTml::Sup, collection: true

      xml do
        element "label"
        map_attribute "id", to: :id
        mixed_content

        map_attribute "xml:lang", to: :xml_lang
        map_content to: :content
        map_element "sup", to: :sup
      end
    end
  end
end

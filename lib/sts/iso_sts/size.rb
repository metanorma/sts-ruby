# frozen_string_literal: true

module Sts
  module IsoSts
    class Size < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :units, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true

      xml do
        element "size"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "units", to: :units
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_content to: :content
      end
    end
  end
end

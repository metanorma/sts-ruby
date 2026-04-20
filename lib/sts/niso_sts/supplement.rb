# frozen_string_literal: true

module Sts
  module NisoSts
    class Supplement < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :suppl_type, :string
      attribute :suppl_version, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      xml do
        element "supplement"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "suppl-type", to: :suppl_type
        map_attribute "suppl-version", to: :suppl_version
        map_attribute "xml:lang", to: :xml_lang
        map_content to: :content
      end
    end
  end
end

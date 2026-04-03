# frozen_string_literal: true

module Sts
  module NisoSts
    class Corresp < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :xml_lang, :string
      attribute :content, :string

      xml do
        element "corresp"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "xml:lang", to: :xml_lang
        map_content to: :content
      end
    end
  end
end

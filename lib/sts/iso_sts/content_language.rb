# frozen_string_literal: true

module Sts
  module IsoSts
    class ContentLanguage < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string, collection: true
      attribute :lang, :string
      attribute :specific_use, :string

      xml do
        element "content-language"
        map_attribute "id", to: :id
        mixed_content

        map_content to: :content
        map_attribute "lang", to: :lang
        map_attribute "specific-use", to: :specific_use
      end
    end
  end
end

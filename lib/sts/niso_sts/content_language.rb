# frozen_string_literal: true

module Sts
  module NisoSts
    class ContentLanguage < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      attribute :lang, :string
      attribute :specific_use, :string

      xml do
        element "content-language"
        mixed_content

        map_content to: :content
        map_attribute "lang", to: :lang
        map_attribute "specific-use", to: :specific_use
      end
    end
  end
end

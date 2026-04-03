# frozen_string_literal: true

module Sts
  module NisoSts
    class Kwd < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :kwd_type, :string
      attribute :xml_lang, :string
      attribute :specific_use, :string
      attribute :content, :string

      xml do
        element "kwd"
        mixed_content

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "kwd-type", to: :kwd_type
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "specific-use", to: :specific_use
        map_content to: :content
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module IsoSts
    class Issue < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :content_type, :string
      attribute :seq, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :id, :string

      xml do
        element "issue"

        map_content to: :content
        map_attribute "content-type", to: :content_type
        map_attribute "seq", to: :seq
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "id", to: :id
      end
    end
  end
end

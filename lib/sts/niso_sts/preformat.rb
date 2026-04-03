# frozen_string_literal: true

module Sts
  module NisoSts
    class Preformat < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :preformat_type, :string
      attribute :xml_space, :string
      attribute :language, :string
      attribute :content, :string

      xml do
        element "preformat"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "preformat-type", to: :preformat_type
        map_attribute "xml:space", to: :xml_space
        map_attribute "language", to: :language
        map_content to: :content
      end
    end
  end
end

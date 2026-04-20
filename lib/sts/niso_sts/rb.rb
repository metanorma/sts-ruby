# frozen_string_literal: true

module Sts
  module NisoSts
    class Rb < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      attribute :content_type, :string
      attribute :id, :string
      attribute :specific_use, :string

      xml do
        element "rb"
        mixed_content

        map_content to: :content
        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
      end
    end
  end
end

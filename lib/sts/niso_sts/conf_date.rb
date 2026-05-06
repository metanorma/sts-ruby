# frozen_string_literal: true

module Sts
  module NisoSts
    class ConfDate < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string, collection: true
      attribute :content_type, :string
      attribute :specific_use, :string

      xml do
        element "conf-date"
        map_attribute "id", to: :id
        mixed_content

        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_content to: :content
      end
    end
  end
end

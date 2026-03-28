# frozen_string_literal: true

module Sts
  module NisoSts
    class NamedContent < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :content, :string

      xml do
        element "named-content"

        map_attribute "content-type", to: :content_type
        map_content to: :content
      end
    end
  end
end

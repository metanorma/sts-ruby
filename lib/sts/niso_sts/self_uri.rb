# frozen_string_literal: true

module Sts
  module NisoSts
    class SelfUri < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :href, :xlink_href
      attribute :content_type, :string
      attribute :language, :string

      xml do
        element "self-uri"
        mixed_content

        map_content to: :content
        map_attribute "xlink:href", to: :href
        map_attribute "content-type", to: :content_type
        map_attribute "language", to: :language
      end
    end
  end
end

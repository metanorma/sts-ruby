# frozen_string_literal: true

module Sts
  module NisoSts
    class RelatedObject < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :ext_link_type, :string
      attribute :href, :xlink_href
      attribute :id, :string

      xml do
        element "related-object"
        mixed_content

        map_content to: :content
        map_attribute "ext-link-type", to: :ext_link_type
        map_attribute "xlink:href", to: :href
        map_attribute "id", to: :id
      end
    end
  end
end

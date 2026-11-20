# frozen_string_literal: true

module Sts
  module NisoSts
    class RelatedObject < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      attribute :ext_link_type, :string
      attribute :href, :xlink_href
      attribute :id, :string
      attribute :named_content, ::Sts::NisoSts::NamedContent,
                collection: true
      attribute :target, ::Sts::NisoSts::Target,
                collection: true

      xml do
        element "related-object"
        mixed_content

        map_content to: :content
        map_attribute "ext-link-type", to: :ext_link_type
        map_attribute "xlink:href", to: :href
        map_attribute "id", to: :id
        map_element "named-content", to: :named_content
        map_element "target", to: :target
      end
    end
  end
end

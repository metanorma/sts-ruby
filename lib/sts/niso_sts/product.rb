# frozen_string_literal: true

module Sts
  module NisoSts
    class Product < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :product_type, :string
      attribute :xlink_href, :string
      attribute :content, :string, collection: true
      attribute :named_content, ::Sts::NisoSts::NamedContent,
                collection: true
      attribute :target, ::Sts::NisoSts::Target,
                collection: true
      xml do
        element "product"
        map_attribute "id", to: :id
        mixed_content

        map_attribute "product-type", to: :product_type
        map_attribute "xlink:href", to: :xlink_href
        map_content to: :content
        map_element "named-content", to: :named_content
        map_element "target", to: :target
      end
    end
  end
end

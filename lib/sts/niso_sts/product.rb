# frozen_string_literal: true

module Sts
  module NisoSts
    class Product < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :product_type, :string
      attribute :xlink_href, :string
      attribute :content, :string, collection: true
      xml do
        element "product"
        map_attribute "id", to: :id
        mixed_content

        map_attribute "product-type", to: :product_type
        map_attribute "xlink:href", to: :xlink_href
        map_content to: :content
      end
    end
  end
end

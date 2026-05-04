# frozen_string_literal: true

module Sts
  module NisoSts
    class List < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :list_type, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :list_item, ::Sts::NisoSts::ListItem, collection: true

      xml do
        element "list"
        ordered

        map_attribute "id", to: :id
        map_attribute "list-type", to: :list_type
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_element "list-item", to: :list_item
      end
    end
  end
end

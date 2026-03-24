# frozen_string_literal: true

module Sts
  module NisoSts
    class List < Lutaml::Model::Serializable
      attribute :text, :string
      attribute :list_type, :string
      attribute :list_item, ::Sts::NisoSts::ListItem, collection: true

      xml do
        element "list"

        map_content to: :text
        map_attribute "list-type", to: :list_type
        map_element "list-item", to: :list_item
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module NisoSts
    class DefList < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :title, :string
      attribute :specific_use, :string
      attribute :list_type, :string
      attribute :def_item, ::Sts::NisoSts::DefItem, collection: true
      attribute :def_list, ::Sts::NisoSts::DefList, collection: true
      attribute :label, ::Sts::NisoSts::Label

      xml do
        element "def-list"
        ordered

        map_attribute "id", to: :id
        map_attribute "list-type", to: :list_type
        map_attribute "specific-use", to: :specific_use

        map_element "title", to: :title
        map_element "def-item", to: :def_item
        map_element "def-list", to: :def_list
        map_element "label", to: :label
      end
    end
  end
end

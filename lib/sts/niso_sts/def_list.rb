# frozen_string_literal: true

require "lutaml/model"

require_relative "def_item"

module Sts
  module NisoSts
    class DefList < Lutaml::Model::Serializable
      attribute :title, :string
      attribute :specific_use, :string
      attribute :list_type, :string
      attribute :def_item, DefItem, collection: true
      attribute :def_list, DefList

      xml do
        root "def-list"

        map_attribute "list-type", to: :list_type
        map_attribute "specific-use", to: :specific_use

        map_element "title", to: :title
        map_element "def-item", to: :def_item
        map_element "def-list", to: :def_list
      end
    end
  end
end

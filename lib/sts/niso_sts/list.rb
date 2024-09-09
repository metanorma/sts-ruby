# frozen_string_literal: true

require_relative "list_item"
require "lutaml/model"

module Sts
  module NisoSts
    class List < Lutaml::Model::Serializable
      attribute :text, Lutaml::Model::Type::String
      attribute :list_type, Lutaml::Model::Type::String
      attribute :list_item, ListItem, collection: true

      xml do
        root "list"

        map_content to: :text
        map_attribute "list-type", to: :list_type
        map_element "list-item", to: :list_item, namespace: nil, prefix: nil
      end
    end
  end
end

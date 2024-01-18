# frozen_string_literal: true

require "shale"

require_relative "list_item"
require_relative "../mapper"

module Sts
  module NisoSts
    class List < Sts::Mapper
      attribute :text, Shale::Type::String
      attribute :list_type, Shale::Type::String
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

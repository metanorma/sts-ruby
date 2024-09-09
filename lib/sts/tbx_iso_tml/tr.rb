# frozen_string_literal: true

require "lutaml/model"

require_relative "th"
require_relative "td"

module Sts
  module TbxIsoTml
    class Tr < Lutaml::Model::Serializable
      attribute :th, Sts::TbxIsoTml::Th, collection: true
      attribute :td, Sts::TbxIsoTml::Td, collection: true

      xml do
        root "tr"

        map_element "th", to: :th
        map_element "td", to: :td
      end
    end
  end
end

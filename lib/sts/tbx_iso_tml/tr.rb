# frozen_string_literal: true

require_relative "../mapper"

require_relative "th"
require_relative "td"

module Sts
  module TbxIsoTml
    class Tr < Sts::Mapper
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

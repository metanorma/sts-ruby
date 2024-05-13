# frozen_string_literal: true

require_relative "../mapper"

require_relative "col"
require_relative "thead"
require_relative "tbody"

module Sts
  module TbxIsoTml
    class Table < Sts::Mapper
      attribute :col, Sts::TbxIsoTml::Col, collection: true
      attribute :thead, Sts::TbxIsoTml::Thead
      attribute :tbody, Sts::TbxIsoTml::Tbody
      attribute :border, Shale::Type::String
      attribute :rules, Shale::Type::String
      attribute :frame, Shale::Type::String
      attribute :width, Shale::Type::String

      xml do
        root "table"

        map_attribute "border", to: :border
        map_attribute "rules", to: :rules
        map_attribute "frame", to: :frame
        map_attribute "width", to: :width

        map_element "col", to: :col
        map_element "thead", to: :thead
        map_element "tbody", to: :tbody
      end
    end
  end
end

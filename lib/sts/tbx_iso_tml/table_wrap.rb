# frozen_string_literal: true

require_relative "../mapper"

require_relative "table"
require_relative "table_wrap_foot"

module Sts
  module TbxIsoTml
    class TableWrap < Sts::Mapper
      attribute :id, Shale::Type::String
      attribute :orientation, Shale::Type::String
      attribute :position, Shale::Type::String
      attribute :label, Shale::Type::String
      attribute :table, Sts::TbxIsoTml::Table, collection: true
      attribute :table_wrap_foot, Sts::TbxIsoTml::TableWrapFoot

      # TODO: This require will cause a loop when defined in header
      require_relative "../niso_sts/caption"
      attribute :caption, Sts::NisoSts::Caption

      xml do
        root "table-wrap"

        map_attribute "id", to: :id
        map_attribute "orientation", to: :orientation
        map_attribute "position", to: :position

        map_element "label", to: :label
        map_element "caption", to: :caption
        map_element "table", to: :table
        map_element "table-wrap-foot", to: :table_wrap_foot
      end
    end
  end
end

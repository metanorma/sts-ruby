# frozen_string_literal: true

require "shale"

require_relative "caption"
require_relative "table"
require_relative "table_wrap_foot"

module Sts
  module TbxIsoTml
    class TableWrap < Shale::Mapper
      attribute :id, Shale::Type::String
      attribute :caption, Sts::TbxIsoTml::Caption
      attribute :table, Sts::TbxIsoTml::Table
      attribute :table_wrap_foot, Sts::TbxIsoTml::TableWrapFoot

      xml do
        root "table-wrap"

        map_attribute "id", to: :id
        map_element "caption", to: :caption
        map_element "table", to: :table
        map_element "table-wrap-foot", to: :table_wrap_foot
      end
    end
  end
end

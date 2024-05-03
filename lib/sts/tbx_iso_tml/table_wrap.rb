# frozen_string_literal: true

require_relative "../mapper"

require_relative "table"
require_relative "table_wrap_foot"

require_relative "../niso_sts/caption"

module Sts
  module TbxIsoTml
    class TableWrap < Sts::Mapper
      attribute :id, Shale::Type::String
      attribute :orientation, Shale::Type::String
      attribute :label, Shale::Type::String
      attribute :caption, Sts::NisoSts::Caption
      attribute :table, Sts::TbxIsoTml::Table, collection: true
      attribute :table_wrap_foot, Sts::TbxIsoTml::TableWrapFoot

      xml do
        root "table-wrap"

        map_attribute "id", to: :id
        map_attribute "orientation", to: :orientation
        map_element "label", to: :label
        map_element "caption", to: :caption
        map_element "table", to: :table
        map_element "table-wrap-foot", to: :table_wrap_foot
      end
    end
  end
end

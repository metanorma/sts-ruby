# frozen_string_literal: true

require_relative "../mapper"

require_relative "../tbx_iso_tml/table"

module Sts
  module NisoSts
    class SectionArray < Sts::Mapper
      attribute :id, Shale::Type::String
      attribute :table, Sts::TbxIsoTml::Table

      xml do
        root "array"

        map_attribute "id", to: :id
        map_element "table", to: :table
      end
    end
  end
end

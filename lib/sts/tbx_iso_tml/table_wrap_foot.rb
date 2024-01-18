# frozen_string_literal: true

require "shale"

require_relative "fn_group"

module Sts
  module TbxIsoTml
    class TableWrapFoot < Shale::Mapper
      attribute :fn_group, Sts::TbxIsoTml::FnGroup

      xml do
        root "table"

        map_element "fn-group", to: :fn_group
      end
    end
  end
end

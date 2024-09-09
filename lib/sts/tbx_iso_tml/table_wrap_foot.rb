# frozen_string_literal: true

require "lutaml/model"

require_relative "fn_group"

module Sts
  module TbxIsoTml
    class TableWrapFoot < Lutaml::Model::Serializable
      attribute :fn_group, Sts::TbxIsoTml::FnGroup

      xml do
        root "table-wrap-foot"

        map_element "fn-group", to: :fn_group
      end
    end
  end
end

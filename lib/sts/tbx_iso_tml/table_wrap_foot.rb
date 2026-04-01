# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class TableWrapFoot < Lutaml::Model::Serializable
      attribute :fn_group, ::Sts::TbxIsoTml::FnGroup

      xml do
        element "table-wrap-foot"

        map_element "fn-group", to: :fn_group
      end
    end
  end
end

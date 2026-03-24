# frozen_string_literal: true


module Sts
  module NisoSts
    class SectionArray < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :table, ::Sts::TbxIsoTml::Table

      xml do
        element "array"

        map_attribute "id", to: :id
        map_element "table", to: :table
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class FnGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :fn, ::Sts::TbxIsoTml::Fn, collection: true

      xml do
        element "fn-group"

        map_attribute "id", to: :id

        map_element "fn", to: :fn
      end
    end
  end
end

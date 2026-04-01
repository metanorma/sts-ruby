# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Thead < Lutaml::Model::Serializable
      attribute :tr, ::Sts::TbxIsoTml::Tr, collection: true
      attribute :char, :string
      attribute :charoff, :string
      attribute :valign, :string

      xml do
        element "thead"

        map_attribute "char", to: :char, value_map: { to: { empty: :empty } }
        map_attribute "charoff", to: :charoff
        map_attribute "valign", to: :valign

        map_element "tr", to: :tr
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Colgroup < Lutaml::Model::Serializable
      attribute :col, ::Sts::TbxIsoTml::Col, collection: true
      attribute :span, :string
      attribute :id, :string
      attribute :width, :string
      attribute :char, :string
      attribute :charoff, :string
      attribute :align, :string
      attribute :valign, :string

      xml do
        element "colgroup"

        map_attribute "span", to: :span
        map_attribute "id", to: :id
        map_attribute "width", to: :width
        map_attribute "char", to: :char, value_map: { to: { empty: :empty } }
        map_attribute "charoff", to: :charoff
        map_attribute "align", to: :align
        map_attribute "valign", to: :valign

        map_element "col", to: :col
      end
    end
  end
end

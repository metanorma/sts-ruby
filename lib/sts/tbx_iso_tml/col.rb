# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Col < Lutaml::Model::Serializable
      attribute :width, :string
      attribute :align, :string
      attribute :valign, :string
      attribute :char, :string
      attribute :charoff, :string
      attribute :span, :string

      xml do
        element "col"

        map_attribute "width", to: :width
        map_attribute "align", to: :align
        map_attribute "valign", to: :valign
        map_attribute "char", to: :char, value_map: { to: { empty: :empty } }
        map_attribute "charoff", to: :charoff
        map_attribute "span", to: :span
      end
    end
  end
end

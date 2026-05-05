# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Col < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :style, :string
      attribute :width, :string
      attribute :align, :string
      attribute :valign, :string
      attribute :char, :string
      attribute :charoff, :string
      attribute :span, :string

      xml do
        element "col"

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "style", to: :style
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

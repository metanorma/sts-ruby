# frozen_string_literal: true

module Sts
  module IsoSts
    class Colgroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :style, :string
      attribute :span, :string
      attribute :width, :string
      attribute :align, :string
      attribute :char, :string
      attribute :charoff, :string
      attribute :valign, :string
      attribute :col, ::Sts::IsoSts::Col, collection: true

      xml do
        element "colgroup"

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "style", to: :style
        map_attribute "span", to: :span
        map_attribute "width", to: :width
        map_attribute "align", to: :align
        map_attribute "char", to: :char
        map_attribute "charoff", to: :charoff
        map_attribute "valign", to: :valign

        map_element "col", to: :col
      end
    end
  end
end

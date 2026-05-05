# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Tr < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :style, :string
      attribute :align, :string
      attribute :char, :string
      attribute :charoff, :string
      attribute :valign, :string
      attribute :th, ::Sts::TbxIsoTml::Th, collection: true
      attribute :td, ::Sts::TbxIsoTml::Td, collection: true

      xml do
        element "tr"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "style", to: :style
        map_attribute "align", to: :align
        map_attribute "char", to: :char
        map_attribute "charoff", to: :charoff
        map_attribute "valign", to: :valign

        map_element "th", to: :th
        map_element "td", to: :td
      end
    end
  end
end

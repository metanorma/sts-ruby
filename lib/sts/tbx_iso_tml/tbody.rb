# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Tbody < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :style, :string
      attribute :align, :string
      attribute :char, :string
      attribute :charoff, :string
      attribute :valign, :string
      attribute :tr, ::Sts::TbxIsoTml::Tr, collection: true

      xml do
        element "tbody"

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "style", to: :style
        map_attribute "align", to: :align
        map_attribute "char", to: :char, value_map: { to: { empty: :empty } }
        map_attribute "charoff", to: :charoff
        map_attribute "valign", to: :valign

        map_element "tr", to: :tr
      end
    end
  end
end

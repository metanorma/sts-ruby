# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Tfoot < Lutaml::Model::Serializable
      attribute :tr, ::Sts::TbxIsoTml::Tr, collection: true
      attribute :content_type, :string
      attribute :align, :string
      attribute :char, :string
      attribute :charoff, :string
      attribute :valign, :string

      xml do
        element "tfoot"

        map_attribute "content-type", to: :content_type
        map_attribute "align", to: :align
        map_attribute "char", to: :char, value_map: { to: { empty: :empty } }
        map_attribute "charoff", to: :charoff
        map_attribute "valign", to: :valign

        map_element "tr", to: :tr
      end
    end
  end
end

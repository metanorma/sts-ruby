# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class Col < Lutaml::Model::Serializable
      attribute :width, :string
      attribute :char, :string
      attribute :charoff, :string
      attribute :span, :string

      xml do
        root "col"

        map_attribute "width", to: :width
        map_attribute "char", to: :char
        map_attribute "charoff", to: :charoff
        map_attribute "span", to: :span
      end
    end
  end
end

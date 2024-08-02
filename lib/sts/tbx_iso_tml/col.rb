# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module TbxIsoTml
    class Col < Sts::Mapper
      attribute :width, Lutaml::Model::Type::String
      attribute :char, Lutaml::Model::Type::String
      attribute :charoff, Lutaml::Model::Type::String
      attribute :span, Lutaml::Model::Type::String

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

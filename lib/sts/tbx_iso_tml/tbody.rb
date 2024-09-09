# frozen_string_literal: true

require "lutaml/model"

require_relative "tr"

module Sts
  module TbxIsoTml
    class Tbody < Lutaml::Model::Serializable
      attribute :tr, Sts::TbxIsoTml::Tr, collection: true
      attribute :char, Lutaml::Model::Type::String
      attribute :charoff, Lutaml::Model::Type::String
      attribute :valign, Lutaml::Model::Type::String

      xml do
        root "tbody"

        map_attribute "char", to: :char
        map_attribute "charoff", to: :charoff
        map_attribute "valign", to: :valign

        map_element "tr", to: :tr
      end
    end
  end
end

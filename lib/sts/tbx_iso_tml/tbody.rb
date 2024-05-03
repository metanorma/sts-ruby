# frozen_string_literal: true

require_relative "../mapper"

require_relative "tr"

module Sts
  module TbxIsoTml
    class Tbody < Sts::Mapper
      attribute :tr, Sts::TbxIsoTml::Tr, collection: true
      attribute :char, Shale::Type::String
      attribute :charoff, Shale::Type::String
      attribute :valign, Shale::Type::String

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

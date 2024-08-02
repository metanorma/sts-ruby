# frozen_string_literal: true

require_relative "../mapper"
require_relative "mspace"

module Sts
  module TbxIsoTml
    class Mstyle < Sts::Mapper
      attribute :mathvariant, Lutaml::Model::Type::String
      attribute :mstyle, Mstyle
      attribute :mspace, Mspace, collection: true
      attribute :mi, Lutaml::Model::Type::String, collection: true
      attribute :mn, Lutaml::Model::Type::String, collection: true
      attribute :mo, Lutaml::Model::Type::String, collection: true

      xml do
        root "mstyle", mixed: true
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_attribute "mathvariant", to: :mathvariant
        map_element "mi", to: :mi
        map_element "mn", to: :mn
        map_element "mo", to: :mo
        map_element "mstyle", to: :mstyle
        map_element "mspace", to: :mspace
      end
    end
  end
end

# frozen_string_literal: true

require "lutaml/model"

require_relative "mrow"

module Sts
  module TbxIsoTml
    class Munderover < Lutaml::Model::Serializable
      attribute :mo, Lutaml::Model::Type::String
      attribute :mi, Lutaml::Model::Type::String
      attribute :mrow, Mrow, collection: true

      xml do
        root "munderover", mixed: true
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_element "mo", to: :mo
        map_element "mi", to: :mi
        map_element "mrow", to: :mrow
      end
    end
  end
end

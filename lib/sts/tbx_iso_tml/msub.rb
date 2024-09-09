# frozen_string_literal: true

require "lutaml/model"

require_relative "mstyle"
require_relative "mrow"
require_relative "mspace"

module Sts
  module TbxIsoTml
    class Msub < Lutaml::Model::Serializable
      attribute :mstyle, Mstyle, collection: true
      attribute :mrow, Mrow
      attribute :mspace, Mspace
      attribute :mo, Lutaml::Model::Type::String, collection: true
      attribute :mi, Lutaml::Model::Type::String, collection: true
      attribute :mn, Lutaml::Model::Type::String, collection: true
      attribute :mtext, Lutaml::Model::Type::String, collection: true

      xml do
        root "msub", mixed: true
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_element "mstyle", to: :mstyle
        map_element "mo", to: :mo
        map_element "mi", to: :mi
        map_element "mn", to: :mn
        map_element "mrow", to: :mrow
        map_element "mtext", to: :mtext
        map_element "mspace", to: :mspace
      end
    end
  end
end

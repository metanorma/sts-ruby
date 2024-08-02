# frozen_string_literal: true

require_relative "../mapper"

require_relative "mstyle"
require_relative "mrow"

module Sts
  module TbxIsoTml
    class Msup < Sts::Mapper
      attribute :mstyle, Mstyle
      attribute :mrow, Mrow
      attribute :mi, Lutaml::Model::Type::String
      attribute :mn, Lutaml::Model::Type::String, collection: true

      xml do
        root "msup"
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_element "mstyle", to: :mstyle
        map_element "mi", to: :mi
        map_element "mn", to: :mn
        map_element "mrow", to: :mrow
      end
    end
  end
end

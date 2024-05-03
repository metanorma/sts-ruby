# frozen_string_literal: true

require_relative "../mapper"
require_relative "mspace"

module Sts
  module TbxIsoTml
    class Mstyle < Sts::Mapper
      attribute :mathvariant, Shale::Type::String
      attribute :mstyle, Mstyle
      attribute :mspace, Mspace
      attribute :mi, Shale::Type::String, collection: true
      attribute :mn, Shale::Type::String, collection: true
      attribute :mo, Shale::Type::String, collection: true

      xml do
        root "math"
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

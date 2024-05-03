# frozen_string_literal: true

require_relative "../mapper"

require_relative "mstyle"
require_relative "mrow"
require_relative "mspace"

module Sts
  module TbxIsoTml
    class Msub < Sts::Mapper
      attribute :mstyle, Mstyle, collection: true
      attribute :mrow, Mrow
      attribute :mspace, Mspace
      attribute :mo, Shale::Type::String, collection: true
      attribute :mi, Shale::Type::String, collection: true
      attribute :mn, Shale::Type::String, collection: true
      attribute :mtext, Shale::Type::String, collection: true

      xml do
        root "mstyle"
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

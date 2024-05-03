# frozen_string_literal: true

require_relative "../mapper"
require_relative "mrow"
require_relative "mstyle"

module Sts
  module TbxIsoTml
    class Mrow < Sts::Mapper; end

    class Mfrac < Sts::Mapper
      attribute :mrow, Mrow, collection: true
      attribute :mstyle, Mstyle, collection: true
      attribute :bevelled, Shale::Type::String
      attribute :linethickness, Shale::Type::String
      attribute :mn, Shale::Type::String
      attribute :mtext, Shale::Type::String

      xml do
        root "math"
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_attribute "bevelled", to: :bevelled
        map_attribute "linethickness", to: :linethickness

        map_element "mrow", to: :mrow
        map_element "mn", to: :mn
        map_element "mtext", to: :mtext
        map_element "mstyle", to: :mstyle
      end
    end
  end
end

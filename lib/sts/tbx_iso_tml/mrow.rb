# frozen_string_literal: true

require_relative "../mapper"
require_relative "mfrac"

module Sts
  module TbxIsoTml
    class Mrow < Sts::Mapper
      attribute :content, Shale::Type::String
      attribute :mo, Shale::Type::String
      attribute :mi, Shale::Type::String
      attribute :mtext, Shale::Type::String
      attribute :mrow, Mrow
      attribute :mfrac, Mfrac

      xml do
        root "math"
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_element "mo", to: :mo
        map_element "mi", to: :mi
        map_element "mtext", to: :mtext
        map_element "mrow", to: :mrow
        map_element "mfrac", to: :mfrac
        map_content to: :content
      end
    end
  end
end

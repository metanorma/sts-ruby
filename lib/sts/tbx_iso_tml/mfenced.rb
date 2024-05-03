# frozen_string_literal: true

require_relative "../mapper"

require_relative "mspace"
require_relative "msub"
require_relative "mstyle"
require_relative "mfrac"

module Sts
  module TbxIsoTml
    class Mfenced < Sts::Mapper
      attribute :separators, Shale::Type::String
      attribute :open, Shale::Type::String
      attribute :close, Shale::Type::String
      attribute :mo, Shale::Type::String
      attribute :mn, Shale::Type::String
      attribute :mi, Shale::Type::String
      attribute :mtext, Shale::Type::String
      attribute :mspace, Mspace, collection: true
      attribute :msub, Msub, collection: true
      attribute :mstyle, Mstyle, collection: true
      attribute :mfrac, Mfrac, collection: true

      xml do
        root "math"
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_attribute "separators", to: :separators
        map_attribute "open", to: :open
        map_attribute "close", to: :close

        map_element "mo", to: :mo
        map_element "mn", to: :mn
        map_element "mi", to: :mi
        map_element "mspace", to: :mspace
        map_element "msub", to: :msub
        map_element "mstyle", to: :mstyle
        map_element "mfrac", to: :mfrac
      end
    end
  end
end

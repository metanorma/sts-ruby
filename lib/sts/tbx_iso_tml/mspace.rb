# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module TbxIsoTml
    class Mspace < Sts::Mapper
      attribute :width, Shale::Type::String

      xml do
        root "mspace"
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_attribute "width", to: :width
      end
    end
  end
end

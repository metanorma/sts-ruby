# frozen_string_literal: true

require_relative "../mapper"
require_relative "mrow"

module Sts
  module TbxIsoTml
    class Mrow < Sts::Mapper; end

    class Mfrac < Sts::Mapper
      attribute :mrow, Mrow, collection: true

      xml do
        root "math"
        namespace "http://www.w3.org/1998/Math/MathML", "mml"

        map_element "mrow", to: :mrow
      end
    end
  end
end

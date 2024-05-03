# frozen_string_literal: true

require "shale"

require_relative "../mapper"
require_relative "../tbx_iso_tml/math"

module Sts
  module NisoSts
    class DisplayFormula < Sts::Mapper
      attribute :id, Shale::Type::String
      attribute :label, Shale::Type::String
      attribute :math, TbxIsoTml::Math

      xml do
        root "disp-formula"

        map_attribute "id", to: :id

        map_element "label", to: :label
        map_element "math", to: :math,
                            namespace: "http://www.w3.org/1998/Math/MathML",
                            prefix: "mml"
      end
    end
  end
end

# frozen_string_literal: true

require "shale"

require_relative "../mapper"
require_relative "../tbx_iso_tml/math"

module Sts
  module NisoSts
    class InlineFormula < Sts::Mapper
      attribute :math, TbxIsoTml::Math

      xml do
        root "inline-formula"

        map_element "math", to: :math,
                            namespace: "http://www.w3.org/1998/Math/MathML",
                            prefix: "mml"
      end
    end
  end
end

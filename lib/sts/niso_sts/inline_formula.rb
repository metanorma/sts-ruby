# frozen_string_literal: true

require "lutaml/model"
require_relative "../tbx_iso_tml/math"

module Sts
  module NisoSts
    class InlineFormula < Lutaml::Model::Serializable
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

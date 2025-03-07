# frozen_string_literal: true

require "lutaml/model"
require_relative "../tbx_iso_tml/math"

module Sts
  module NisoSts
    class DisplayFormula < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :label, Label
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

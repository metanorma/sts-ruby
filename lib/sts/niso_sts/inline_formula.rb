# frozen_string_literal: true

require "lutaml/model"

module Sts
  module NisoSts
    class InlineFormula < Lutaml::Model::Serializable
      attribute :math, ::Sts::TbxIsoTml::Math

      xml do
        element "inline-formula"

        map_element "math", to: :math
      end
    end
  end
end

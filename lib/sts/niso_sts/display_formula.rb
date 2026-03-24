# frozen_string_literal: true

require "lutaml/model"

module Sts
  module NisoSts
    class DisplayFormula < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :math, ::Sts::TbxIsoTml::Math

      xml do
        element "disp-formula"

        map_attribute "id", to: :id

        map_element "label", to: :label
        map_element "math", to: :math
      end
    end
  end
end

# frozen_string_literal: true

require "lutaml/model"

module Sts
  module NisoSts
    class DispFormulaGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :disp_formula, ::Sts::NisoSts::DisplayFormula, collection: true

      xml do
        element "disp-formula-group"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type

        map_element "label", to: :label
        map_element "disp-formula", to: :disp_formula
      end
    end
  end
end

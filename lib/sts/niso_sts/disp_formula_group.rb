# frozen_string_literal: true

module Sts
  module NisoSts
    class DispFormulaGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :caption, ::Sts::NisoSts::Caption
      attribute :disp_formula, ::Sts::NisoSts::DisplayFormula, collection: true

      xml do
        element "disp-formula-group"

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use

        map_element "label", to: :label
        map_element "caption", to: :caption
        map_element "disp-formula", to: :disp_formula
      end
    end
  end
end

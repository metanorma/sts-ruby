# frozen_string_literal: true

require "lutaml/model"

module Sts
  module NisoSts
    class InlineFormula < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :math, ::Sts::TbxIsoTml::Math
      attribute :alternatives, ::Sts::NisoSts::Alternatives
      attribute :preformat, ::Sts::NisoSts::Preformat

      xml do
        element "inline-formula"

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use

        map_element "math", to: :math
        map_element "alternatives", to: :alternatives
        map_element "preformat", to: :preformat
      end
    end
  end
end

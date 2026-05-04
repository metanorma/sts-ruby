# frozen_string_literal: true

require "lutaml/model"

module Sts
  module NisoSts
    class DisplayFormula < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :math, ::Sts::TbxIsoTml::Math
      attribute :preformat, ::Sts::NisoSts::Preformat
      attribute :tex_math, ::Sts::NisoSts::TexMath
      attribute :graphic, ::Sts::NisoSts::Graphic, collection: true
      attribute :alternatives, ::Sts::NisoSts::Alternatives

      xml do
        element "disp-formula"

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use

        map_element "label", to: :label
        map_element "math", to: :math
        map_element "preformat", to: :preformat
        map_element "tex-math", to: :tex_math
        map_element "graphic", to: :graphic
        map_element "alternatives", to: :alternatives
      end
    end
  end
end

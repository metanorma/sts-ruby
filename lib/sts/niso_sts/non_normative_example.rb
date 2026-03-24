# frozen_string_literal: true


module Sts
  module NisoSts

    class NonNormativeExample < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :p, ::Sts::NisoSts::Paragraph
      attribute :label, ::Sts::NisoSts::Label

      xml do
        element "non-normative-example"
        mixed_content

        map_attribute "id", to: :id
        map_element "p", to: :p
        map_element "label", to: :label
      end
    end
  end
end

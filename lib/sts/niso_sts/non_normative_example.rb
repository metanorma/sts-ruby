# frozen_string_literal: true

module Sts
  module NisoSts
    class NonNormativeExample < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :p, ::Sts::NisoSts::Paragraph, collection: true
      attribute :label, ::Sts::NisoSts::Label
      attribute :list, ::Sts::NisoSts::List, collection: true
      attribute :preformat, ::Sts::NisoSts::Preformat, collection: true
      attribute :boxed_text, ::Sts::NisoSts::BoxedText, collection: true
      attribute :graphic, ::Sts::NisoSts::Graphic, collection: true
      attribute :non_normative_example, ::Sts::NisoSts::NonNormativeExample,
                collection: true

      xml do
        element "non-normative-example"
        ordered

        map_attribute "id", to: :id
        map_element "p", to: :p
        map_element "label", to: :label
        map_element "list", to: :list
        map_element "preformat", to: :preformat
        map_element "boxed-text", to: :boxed_text
        map_element "graphic", to: :graphic
        map_element "non-normative-example", to: :non_normative_example
      end
    end
  end
end

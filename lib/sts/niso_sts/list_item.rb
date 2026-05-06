# frozen_string_literal: true

module Sts
  module NisoSts
    class ListItem < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :list, ::Sts::NisoSts::List, collection: true
      attribute :non_normative_example, ::Sts::NisoSts::NonNormativeExample,
                collection: true
      attribute :non_normative_note, ::Sts::NisoSts::NonNormativeNote,
                collection: true
      attribute :p, ::Sts::NisoSts::Paragraph, collection: true

      xml do
        element "list-item"
        ordered

        map_attribute "id", to: :id
        map_element "label", to: :label
        map_element "list", to: :list
        map_element "non-normative-example", to: :non_normative_example
        map_element "non-normative-note", to: :non_normative_note
        map_element "p", to: :p
      end
    end
  end
end

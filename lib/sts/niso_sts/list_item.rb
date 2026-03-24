# frozen_string_literal: true

require "lutaml/model"

module Sts
  module NisoSts
    class ListItem < Lutaml::Model::Serializable
      attribute :label, ::Sts::NisoSts::Label
      attribute :list, ::Sts::NisoSts::List
      attribute :non_normative_example, ::Sts::NisoSts::NonNormativeExample
      attribute :p, ::Sts::NisoSts::Paragraph

      xml do
        element "list-item"

        map_element "label", to: :label
        map_element "list", to: :list
        map_element "non-normative-example", to: :non_normative_example
        map_element "p", to: :p
      end
    end
  end
end

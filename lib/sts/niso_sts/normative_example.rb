# frozen_string_literal: true

module Sts
  module NisoSts
    class NormativeExample < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :xml_lang, :string
      attribute :specific_use, :string
      attribute :symbol, :string
      attribute :p, ::Sts::NisoSts::Paragraph, collection: true
      attribute :label, ::Sts::NisoSts::Label
      attribute :list, ::Sts::NisoSts::List, collection: true
      attribute :non_normative_example, ::Sts::NisoSts::NonNormativeExample,
                collection: true

      xml do
        element "normative-example"
        ordered

        map_attribute "id", to: :id
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "specific-use", to: :specific_use
        map_attribute "symbol", to: :symbol

        map_element "p", to: :p
        map_element "label", to: :label
        map_element "list", to: :list
        map_element "non-normative-example", to: :non_normative_example
      end
    end
  end
end

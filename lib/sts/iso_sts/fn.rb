# frozen_string_literal: true

module Sts
  module IsoSts
    class Fn < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :fn_type, :string
      attribute :specific_use, :string
      attribute :symbol, :string
      attribute :xml_lang, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :paragraph, ::Sts::IsoSts::Paragraph, collection: true
      attribute :non_normative_note, ::Sts::IsoSts::NonNormativeNote
      attribute :non_normative_example, ::Sts::IsoSts::NonNormativeExample

      xml do
        element "fn"
        ordered

        map_attribute "id", to: :id
        map_attribute "fn-type", to: :fn_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "symbol", to: :symbol
        map_attribute "xml:lang", to: :xml_lang

        map_element "label", to: :label
        map_element "p", to: :paragraph
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
      end
    end
  end
end

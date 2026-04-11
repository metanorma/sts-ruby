# frozen_string_literal: true

module Sts
  module IsoSts
    class Def < Lutaml::Model::Serializable
      attribute :rid, :string
      attribute :id, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :paragraph, ::Sts::IsoSts::Paragraph, collection: true
      attribute :non_normative_note, ::Sts::IsoSts::NonNormativeNote
      attribute :non_normative_example, ::Sts::IsoSts::NonNormativeExample

      xml do
        element "def"

        map_attribute "rid", to: :rid
        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_element "p", to: :paragraph
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
      end
    end
  end
end

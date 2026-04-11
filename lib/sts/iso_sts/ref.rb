# frozen_string_literal: true

module Sts
  module IsoSts
    class Ref < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :mixed_citation, ::Sts::IsoSts::MixedCitation
      attribute :element_citation, ::Sts::NisoSts::ElementCitation
      attribute :std, ::Sts::IsoSts::Std
      attribute :non_normative_note, ::Sts::IsoSts::NonNormativeNote
      attribute :non_normative_example, ::Sts::IsoSts::NonNormativeExample

      xml do
        element "ref"

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_element "label", to: :label
        map_element "mixed-citation", to: :mixed_citation
        map_element "element-citation", to: :element_citation
        map_element "std", to: :std
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
      end
    end
  end
end

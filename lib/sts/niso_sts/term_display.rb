# frozen_string_literal: true

module Sts
  module NisoSts
    class TermDisplay < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :term, ::Sts::NisoSts::Term, collection: true
      attribute :definition, ::Sts::NisoSts::Def
      attribute :term_display_string, :string, collection: true
      attribute :list, ::Sts::NisoSts::List, collection: true
      attribute :def_list, ::Sts::NisoSts::DefList, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :label, ::Sts::NisoSts::Label
      attribute :p, ::Sts::NisoSts::Paragraph, collection: true
      attribute :non_normative_note, ::Sts::NisoSts::NonNormativeNote,
                collection: true
      attribute :non_normative_example, ::Sts::NisoSts::NonNormativeExample,
                collection: true
      attribute :related_term, ::Sts::NisoSts::RelatedTerm, collection: true

      xml do
        element "term-display"
        map_attribute "id", to: :id
        mixed_content

        map_element "term", to: :term
        map_element "def", to: :definition
        map_element "term-display-string", to: :term_display_string
        map_element "list", to: :list
        map_element "def-list", to: :def_list
        map_element "xref", to: :xref
        map_element "label", to: :label
        map_element "p", to: :p
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "related-term", to: :related_term
      end
    end
  end
end

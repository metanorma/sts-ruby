# frozen_string_literal: true

module Sts
  module NisoSts
    class Section < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :specific_use, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :title, ::Sts::NisoSts::Title
      attribute :type, :string
      attribute :array, ::Sts::NisoSts::SectionArray
      attribute :paragraphs, ::Sts::NisoSts::Paragraph, collection: true
      attribute :list, ::Sts::NisoSts::List, collection: true
      attribute :term_sec, ::Sts::NisoSts::TermSection, collection: true
      attribute :ref_list, ::Sts::NisoSts::ReferenceList, collection: true
      attribute :non_normative_note, ::Sts::NisoSts::NonNormativeNote,
                collection: true
      attribute :non_normative_example, ::Sts::NisoSts::NonNormativeExample,
                collection: true
      attribute :sec, ::Sts::NisoSts::Section, collection: true
      attribute :figures, ::Sts::NisoSts::Figure, collection: true
      attribute :fig, ::Sts::NisoSts::Figure, collection: true

      attribute :table_wrap, ::Sts::TbxIsoTml::TableWrap, collection: true

      xml do
        element "sec"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "sec-type", to: :type
        map_attribute "specific-use", to: :specific_use

        map_element "label", to: :label
        map_element "title", to: :title
        map_element "p", to: :paragraphs
        map_element "sec", to: :sec
        map_element "term-sec", to: :term_sec
        map_element "list", to: :list
        map_element "figure", to: :figures
        map_element "fig", to: :fig
        map_element "ref-list", to: :ref_list
        map_element "array", to: :array
        map_element "table-wrap", to: :table_wrap
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
      end
    end
  end
end

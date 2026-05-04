# frozen_string_literal: true

module Sts
  module NisoSts
    class App < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :annex_type, :string
      attribute :title, ::Sts::NisoSts::Title
      attribute :fig, ::Sts::NisoSts::Figure, collection: true
      attribute :sec, ::Sts::NisoSts::Section, collection: true
      attribute :paragraph, ::Sts::NisoSts::Paragraph, collection: true
      attribute :ref_list, ::Sts::NisoSts::ReferenceList, collection: true
      attribute :non_normative_note, ::Sts::NisoSts::NonNormativeNote,
                collection: true
      attribute :non_normative_example, ::Sts::NisoSts::NonNormativeExample,
                collection: true
      attribute :table_wrap, ::Sts::TbxIsoTml::TableWrap, collection: true
      attribute :list, ::Sts::NisoSts::List, collection: true
      attribute :array, ::Sts::NisoSts::SectionArray
      attribute :preformat, ::Sts::NisoSts::Preformat, collection: true
      attribute :boxed_text, ::Sts::NisoSts::BoxedText, collection: true

      xml do
        element "app"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type

        map_element "label", to: :label
        map_element "annex-type", to: :annex_type
        map_element "title", to: :title
        map_element "sec", to: :sec
        map_element "fig", to: :fig
        map_element "p", to: :paragraph
        map_element "ref-list", to: :ref_list
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "table-wrap", to: :table_wrap
        map_element "list", to: :list
        map_element "array", to: :array
        map_element "preformat", to: :preformat
        map_element "boxed-text", to: :boxed_text
      end
    end
  end
end

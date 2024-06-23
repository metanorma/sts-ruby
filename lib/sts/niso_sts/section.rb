# frozen_string_literal: true

require_relative "../mapper"

require_relative "paragraph"
require_relative "list"
require_relative "term_section"
require_relative "reference_list"
require_relative "non_normative_note"
require_relative "non_normative_example"
require_relative "figure"
require_relative "title"
require_relative "section_array"

require_relative "../tbx_iso_tml/table_wrap"

module Sts
  module NisoSts
    class Title < Sts::Mapper; end

    class Section < Sts::Mapper
      attribute :id, Shale::Type::String
      attribute :specific_use, Shale::Type::String
      attribute :label, Label
      attribute :title, Title
      attribute :type, Shale::Type::String
      attribute :array, SectionArray
      attribute :paragraphs, Paragraph, collection: true
      attribute :list, List, collection: true
      attribute :term_sec, TermSection, collection: true
      attribute :ref_list, ReferenceList, collection: true
      attribute :non_normative_note, NonNormativeNote, collection: true
      attribute :non_normative_example, NonNormativeExample, collection: true
      attribute :sec, Section, collection: true
      attribute :figures, Figure, collection: true
      attribute :fig, Figure, collection: true

      attribute :table_wrap, ::Sts::TbxIsoTml::TableWrap, collection: true

      xml do
        root "sec"

        map_attribute "id", to: :id
        map_attribute "sec-type", to: :type
        map_attribute "specific-use", to: :specific_use

        map_element "label", to: :label, render_nil: true
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

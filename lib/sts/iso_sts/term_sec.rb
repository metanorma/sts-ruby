# frozen_string_literal: true

module Sts
  module IsoSts
    class TermSec < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :xml_lang, :string
      attribute :sec_type, :string
      attribute :specific_use, :string
      attribute :originator, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :term_entry, ::Sts::TbxIsoTml::TermEntry
      attribute :term_display, ::Sts::NisoSts::TermDisplay, collection: true
      attribute :paragraph, ::Sts::IsoSts::Paragraph, collection: true
      attribute :list, ::Sts::IsoSts::List, collection: true
      attribute :def_list, ::Sts::IsoSts::DefList, collection: true
      attribute :non_normative_note, ::Sts::IsoSts::NonNormativeNote,
                collection: true
      attribute :non_normative_example, ::Sts::IsoSts::NonNormativeExample,
                collection: true
      attribute :fn_group, ::Sts::IsoSts::FnGroup, collection: true
      attribute :ref_list, ::Sts::IsoSts::RefList, collection: true
      attribute :term_sec, ::Sts::IsoSts::TermSec, collection: true

      xml do
        element "term-sec"

        map_attribute "id", to: :id
        map_attribute "lang", to: :xml_lang
        map_attribute "sec-type", to: :sec_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "originator", to: :originator

        map_element "label", to: :label
        map_element "termEntry", to: :term_entry
        map_element "term-display", to: :term_display
        map_element "p", to: :paragraph
        map_element "list", to: :list
        map_element "def-list", to: :def_list
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "fn-group", to: :fn_group
        map_element "ref-list", to: :ref_list
        map_element "term-sec", to: :term_sec
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module IsoSts
    class BoxedText < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :position, :string
      attribute :orientation, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content_type, :string
      attribute :originator, :string
      attribute :sts_object_id, ::Sts::IsoSts::ObjectId, collection: true
      attribute :label, ::Sts::IsoSts::Label
      attribute :caption, ::Sts::IsoSts::Caption
      attribute :paragraph, ::Sts::IsoSts::Paragraph, collection: true
      attribute :list, ::Sts::IsoSts::List, collection: true
      attribute :def_list, ::Sts::IsoSts::DefList, collection: true
      attribute :non_normative_note, ::Sts::IsoSts::NonNormativeNote,
                collection: true
      attribute :non_normative_example, ::Sts::IsoSts::NonNormativeExample,
                collection: true
      attribute :preformat, ::Sts::IsoSts::Preformat, collection: true
      attribute :fig, ::Sts::IsoSts::Fig, collection: true
      attribute :graphic, ::Sts::IsoSts::Graphic, collection: true
      attribute :disp_formula, ::Sts::IsoSts::DispFormula, collection: true
      attribute :disp_quote, ::Sts::IsoSts::DispQuote, collection: true
      attribute :boxed_text, ::Sts::IsoSts::BoxedText, collection: true
      attribute :sec, ::Sts::IsoSts::Sec, collection: true
      attribute :term_sec, ::Sts::IsoSts::TermSec, collection: true
      attribute :fn_group, ::Sts::IsoSts::FnGroup, collection: true
      attribute :ref_list, ::Sts::IsoSts::RefList, collection: true
      attribute :attrib, ::Sts::IsoSts::Attrib, collection: true
      attribute :permissions, ::Sts::IsoSts::Permissions, collection: true

      xml do # rubocop:disable Metrics/BlockLength
        element "boxed-text"
        ordered

        map_attribute "id", to: :id
        map_attribute "position", to: :position
        map_attribute "orientation", to: :orientation
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "content-type", to: :content_type
        map_attribute "originator", to: :originator

        map_element "object-id", to: :sts_object_id
        map_element "label", to: :label
        map_element "caption", to: :caption
        map_element "p", to: :paragraph
        map_element "list", to: :list
        map_element "def-list", to: :def_list
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "preformat", to: :preformat
        map_element "fig", to: :fig
        map_element "graphic", to: :graphic
        map_element "disp-formula", to: :disp_formula
        map_element "disp-quote", to: :disp_quote
        map_element "boxed-text", to: :boxed_text
        map_element "sec", to: :sec
        map_element "term-sec", to: :term_sec
        map_element "fn-group", to: :fn_group
        map_element "ref-list", to: :ref_list
        map_element "attrib", to: :attrib
        map_element "permissions", to: :permissions
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module NisoSts
    class BoxedText < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :form_type, :string
      attribute :is_form, :string
      attribute :orientation, :string
      attribute :originator, :string
      attribute :position, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :caption, ::Sts::NisoSts::Caption
      attribute :paragraphs, ::Sts::NisoSts::Paragraph, collection: true
      attribute :list, ::Sts::NisoSts::List, collection: true
      attribute :def_list, ::Sts::NisoSts::DefList, collection: true
      attribute :preformat, ::Sts::NisoSts::Preformat, collection: true
      attribute :fig, ::Sts::NisoSts::Figure, collection: true
      attribute :graphic, ::Sts::NisoSts::Graphic, collection: true
      attribute :disp_formula, ::Sts::NisoSts::DisplayFormula, collection: true
      attribute :disp_quote, ::Sts::NisoSts::DispQuote, collection: true
      attribute :sec, ::Sts::NisoSts::Section, collection: true
      attribute :fn_group, ::Sts::NisoSts::FnGroup, collection: true
      attribute :ref_list, ::Sts::NisoSts::ReferenceList, collection: true
      attribute :non_normative_note, ::Sts::NisoSts::NonNormativeNote,
                collection: true
      attribute :non_normative_example, ::Sts::NisoSts::NonNormativeExample,
                collection: true
      attribute :attrib, ::Sts::NisoSts::Attrib, collection: true
      attribute :permissions, ::Sts::NisoSts::Permissions

      xml do
        element "boxed-text"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "form-type", to: :form_type
        map_attribute "is-form", to: :is_form
        map_attribute "orientation", to: :orientation
        map_attribute "originator", to: :originator
        map_attribute "position", to: :position
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_element "label", to: :label
        map_element "caption", to: :caption
        map_element "p", to: :paragraphs
        map_element "list", to: :list
        map_element "def-list", to: :def_list
        map_element "preformat", to: :preformat
        map_element "fig", to: :fig
        map_element "graphic", to: :graphic
        map_element "disp-formula", to: :disp_formula
        map_element "disp-quote", to: :disp_quote
        map_element "sec", to: :sec
        map_element "fn-group", to: :fn_group
        map_element "ref-list", to: :ref_list
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "attrib", to: :attrib
        map_element "permissions", to: :permissions
      end
    end
  end
end

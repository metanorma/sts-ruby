# frozen_string_literal: true

module Sts
  module IsoSts
    class Fig < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :position, :string
      attribute :orientation, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :fig_type, :string
      attribute :originator, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :caption, ::Sts::IsoSts::Caption
      attribute :graphic, ::Sts::IsoSts::Graphic, collection: true
      attribute :table_wrap, ::Sts::TbxIsoTml::TableWrap
      attribute :paragraph, ::Sts::IsoSts::Paragraph, collection: true
      attribute :non_normative_note, ::Sts::IsoSts::NonNormativeNote,
                collection: true
      attribute :non_normative_example, ::Sts::IsoSts::NonNormativeExample,
                collection: true
      attribute :fn_group, ::Sts::IsoSts::FnGroup
      attribute :fn, ::Sts::IsoSts::Fn, collection: true
      attribute :def_list, ::Sts::IsoSts::DefList
      attribute :list, ::Sts::IsoSts::List
      attribute :disp_formula, ::Sts::IsoSts::DispFormula, collection: true
      attribute :preformat, ::Sts::IsoSts::Preformat, collection: true

      xml do
        element "fig"

        map_attribute "id", to: :id
        map_attribute "position", to: :position
        map_attribute "orientation", to: :orientation
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "fig-type", to: :fig_type
        map_attribute "originator", to: :originator

        map_element "label", to: :label
        map_element "caption", to: :caption
        map_element "graphic", to: :graphic
        map_element "table-wrap", to: :table_wrap
        map_element "p", to: :paragraph
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "fn-group", to: :fn_group
        map_element "fn", to: :fn
        map_element "def-list", to: :def_list
        map_element "list", to: :list
        map_element "disp-formula", to: :disp_formula
        map_element "preformat", to: :preformat
      end
    end
  end
end

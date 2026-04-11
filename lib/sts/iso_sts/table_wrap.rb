# frozen_string_literal: true

module Sts
  module IsoSts
    class TableWrap < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :position, :string
      attribute :orientation, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content_type, :string
      attribute :originator, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :caption, ::Sts::IsoSts::Caption
      attribute :table, ::Sts::IsoSts::Table, collection: true
      attribute :table_wrap_foot, ::Sts::IsoSts::TableWrapFoot
      attribute :graphic, ::Sts::IsoSts::Graphic, collection: true
      attribute :preformat, ::Sts::IsoSts::Preformat, collection: true
      attribute :non_normative_note, ::Sts::IsoSts::NonNormativeNote,
                collection: true
      attribute :non_normative_example, ::Sts::IsoSts::NonNormativeExample,
                collection: true
      attribute :list, ::Sts::IsoSts::List
      attribute :def_list, ::Sts::IsoSts::DefList

      xml do
        element "table-wrap"

        map_attribute "id", to: :id
        map_attribute "position", to: :position
        map_attribute "orientation", to: :orientation
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "content-type", to: :content_type
        map_attribute "originator", to: :originator

        map_element "label", to: :label
        map_element "caption", to: :caption
        map_element "table", to: :table
        map_element "table-wrap-foot", to: :table_wrap_foot
        map_element "graphic", to: :graphic
        map_element "preformat", to: :preformat
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "list", to: :list
        map_element "def-list", to: :def_list
      end
    end
  end
end

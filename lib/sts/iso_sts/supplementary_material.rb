# frozen_string_literal: true

module Sts
  module IsoSts
    class SupplementaryMaterial < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :position, :string
      attribute :orientation, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content_type, :string
      attribute :mimetype, :string
      attribute :mime_subtype, :string
      attribute :xlink_type, :string
      attribute :xlink_href, :string
      attribute :xlink_role, :string
      attribute :xlink_title, :string
      attribute :xlink_show, :string
      attribute :xlink_actuate, :string
      attribute :originator, :string
      attribute :sts_object_id, ::Sts::IsoSts::ObjectId, collection: true
      attribute :label, ::Sts::IsoSts::Label
      attribute :caption, ::Sts::IsoSts::Caption
      attribute :alt_text, ::Sts::IsoSts::AltText, collection: true
      attribute :long_desc, ::Sts::IsoSts::LongDesc, collection: true
      attribute :email, ::Sts::IsoSts::Email, collection: true
      attribute :ext_link, ::Sts::IsoSts::ExtLink, collection: true
      attribute :uri, ::Sts::IsoSts::Uri, collection: true
      attribute :disp_formula, ::Sts::IsoSts::DispFormula, collection: true
      attribute :disp_formula_group, ::Sts::IsoSts::DispFormulaGroup,
                collection: true
      attribute :chem_struct_wrap, ::Sts::IsoSts::ChemStructWrap,
                collection: true
      attribute :fn_group, ::Sts::IsoSts::FnGroup, collection: true
      attribute :fn, ::Sts::IsoSts::Fn, collection: true
      attribute :disp_quote, ::Sts::IsoSts::DispQuote, collection: true
      attribute :speech, ::Sts::IsoSts::Speech, collection: true
      attribute :statement, ::Sts::IsoSts::Statement, collection: true
      attribute :verse_group, ::Sts::IsoSts::VerseGroup, collection: true
      attribute :table_wrap, ::Sts::IsoSts::TableWrap, collection: true
      attribute :paragraph, ::Sts::IsoSts::Paragraph, collection: true
      attribute :non_normative_note, ::Sts::IsoSts::NonNormativeNote,
                collection: true
      attribute :non_normative_example, ::Sts::IsoSts::NonNormativeExample,
                collection: true
      attribute :def_list, ::Sts::IsoSts::DefList, collection: true
      attribute :list, ::Sts::IsoSts::List, collection: true
      attribute :alternatives, ::Sts::IsoSts::Alternatives, collection: true
      attribute :array, ::Sts::IsoSts::Array, collection: true
      attribute :graphic, ::Sts::IsoSts::Graphic, collection: true
      attribute :media, ::Sts::IsoSts::Media, collection: true
      attribute :preformat, ::Sts::IsoSts::Preformat, collection: true
      attribute :attrib, ::Sts::IsoSts::Attrib, collection: true
      attribute :permissions, ::Sts::IsoSts::Permissions, collection: true

      xml do # rubocop:disable Metrics/BlockLength
        element "supplementary-material"
        ordered

        map_attribute "id", to: :id
        map_attribute "position", to: :position
        map_attribute "orientation", to: :orientation
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "content-type", to: :content_type
        map_attribute "mimetype", to: :mimetype
        map_attribute "mime-subtype", to: :mime_subtype
        map_attribute "xlink:type", to: :xlink_type
        map_attribute "xlink:href", to: :xlink_href
        map_attribute "xlink:role", to: :xlink_role
        map_attribute "xlink:title", to: :xlink_title
        map_attribute "xlink:show", to: :xlink_show
        map_attribute "xlink:actuate", to: :xlink_actuate
        map_attribute "originator", to: :originator
        map_element "object-id", to: :sts_object_id
        map_element "label", to: :label
        map_element "caption", to: :caption
        map_element "alt-text", to: :alt_text
        map_element "long-desc", to: :long_desc
        map_element "email", to: :email
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
        map_element "disp-formula", to: :disp_formula
        map_element "disp-formula-group", to: :disp_formula_group
        map_element "chem-struct-wrap", to: :chem_struct_wrap
        map_element "fn-group", to: :fn_group
        map_element "fn", to: :fn
        map_element "disp-quote", to: :disp_quote
        map_element "speech", to: :speech
        map_element "statement", to: :statement
        map_element "verse-group", to: :verse_group
        map_element "table-wrap", to: :table_wrap
        map_element "p", to: :paragraph
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "def-list", to: :def_list
        map_element "list", to: :list
        map_element "alternatives", to: :alternatives
        map_element "array", to: :array
        map_element "graphic", to: :graphic
        map_element "media", to: :media
        map_element "preformat", to: :preformat
        map_element "attrib", to: :attrib
        map_element "permissions", to: :permissions
      end
    end
  end
end

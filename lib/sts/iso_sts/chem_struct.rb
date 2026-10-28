# frozen_string_literal: true

module Sts
  module IsoSts
    class ChemStruct < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :xlink_type, :string
      attribute :xlink_href, :string
      attribute :xlink_role, :string
      attribute :xlink_title, :string
      attribute :xlink_show, :string
      attribute :xlink_actuate, :string
      attribute :content, :string, collection: true
      attribute :alt_text, ::Sts::IsoSts::AltText, collection: true
      attribute :long_desc, ::Sts::IsoSts::LongDesc, collection: true
      attribute :email, ::Sts::IsoSts::Email, collection: true
      attribute :ext_link, ::Sts::IsoSts::ExtLink, collection: true
      attribute :uri, ::Sts::IsoSts::Uri, collection: true
      attribute :break, ::Sts::IsoSts::Break, collection: true
      attribute :bold, ::Sts::IsoSts::Bold, collection: true
      attribute :italic, ::Sts::IsoSts::Italic, collection: true
      attribute :monospace, ::Sts::IsoSts::Monospace, collection: true
      attribute :num, ::Sts::IsoSts::Num, collection: true
      attribute :overline, ::Sts::IsoSts::Overline, collection: true
      attribute :roman, ::Sts::IsoSts::Roman, collection: true
      attribute :sans_serif, ::Sts::IsoSts::SansSerif, collection: true
      attribute :sc, ::Sts::IsoSts::Sc, collection: true
      attribute :strike, ::Sts::IsoSts::Strike, collection: true
      attribute :underline, ::Sts::IsoSts::Underline, collection: true
      attribute :label, ::Sts::IsoSts::Label, collection: true
      attribute :def_list, ::Sts::IsoSts::DefList, collection: true
      attribute :list, ::Sts::IsoSts::List, collection: true
      attribute :math, ::Mml::V2::Math, collection: true
      attribute :named_content, ::Sts::IsoSts::NamedContent, collection: true
      attribute :styled_content, ::Sts::IsoSts::StyledContent, collection: true
      attribute :alternatives, ::Sts::IsoSts::Alternatives, collection: true
      attribute :array, ::Sts::IsoSts::Array, collection: true
      attribute :graphic, ::Sts::IsoSts::Graphic, collection: true
      attribute :media, ::Sts::IsoSts::Media, collection: true
      attribute :preformat, ::Sts::IsoSts::Preformat, collection: true
      attribute :fn, ::Sts::IsoSts::Fn, collection: true
      attribute :target, ::Sts::IsoSts::Target, collection: true
      attribute :entailed_term, ::Sts::TbxIsoTml::EntailedTerm, collection: true
      attribute :xref, ::Sts::IsoSts::Xref, collection: true
      attribute :sub, ::Sts::IsoSts::Sub, collection: true
      attribute :sup, ::Sts::IsoSts::Sup, collection: true

      xml do # rubocop:disable Metrics/BlockLength
        element "chem-struct"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "xlink:type", to: :xlink_type
        map_attribute "xlink:href", to: :xlink_href
        map_attribute "xlink:role", to: :xlink_role
        map_attribute "xlink:title", to: :xlink_title
        map_attribute "xlink:show", to: :xlink_show
        map_attribute "xlink:actuate", to: :xlink_actuate
        map_content to: :content
        map_element "alt-text", to: :alt_text
        map_element "long-desc", to: :long_desc
        map_element "email", to: :email
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
        map_element "break", to: :break
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "monospace", to: :monospace
        map_element "num", to: :num
        map_element "overline", to: :overline
        map_element "roman", to: :roman
        map_element "sans-serif", to: :sans_serif
        map_element "sc", to: :sc
        map_element "strike", to: :strike
        map_element "underline", to: :underline
        map_element "label", to: :label
        map_element "def-list", to: :def_list
        map_element "list", to: :list
        map_element "math", to: :math
        map_element "named-content", to: :named_content
        map_element "styled-content", to: :styled_content
        map_element "alternatives", to: :alternatives
        map_element "array", to: :array
        map_element "graphic", to: :graphic
        map_element "media", to: :media
        map_element "preformat", to: :preformat
        map_element "fn", to: :fn
        map_element "target", to: :target
        map_element "entailedTerm", to: :entailed_term
        map_element "xref", to: :xref
        map_element "sub", to: :sub
        map_element "sup", to: :sup
      end
    end
  end
end

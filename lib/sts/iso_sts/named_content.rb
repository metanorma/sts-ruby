# frozen_string_literal: true

module Sts
  module IsoSts
    class NamedContent < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :alt, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :xlink_href, :string
      attribute :xlink_type, :string
      attribute :xlink_role, :string
      attribute :xlink_title, :string
      attribute :xlink_show, :string
      attribute :xlink_actuate, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::IsoSts::Bold, collection: true
      attribute :italic, ::Sts::IsoSts::Italic, collection: true
      attribute :sub, ::Sts::IsoSts::Sub, collection: true
      attribute :sup, ::Sts::IsoSts::Sup, collection: true
      attribute :target, ::Sts::IsoSts::Target,
                collection: true
      attribute :named_content, ::Sts::IsoSts::NamedContent,
                collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref,
                collection: true
      attribute :styled_content, ::Sts::IsoSts::StyledContent,
                collection: true
      attribute :std, ::Sts::IsoSts::Std,
                collection: true
      attribute :ext_link, ::Sts::IsoSts::ExtLink,
                collection: true
      attribute :monospace, ::Sts::IsoSts::Monospace,
                collection: true
      attribute :sc, ::Sts::IsoSts::Sc,
                collection: true
      attribute :strike, ::Sts::IsoSts::Strike,
                collection: true
      attribute :underline, ::Sts::IsoSts::Underline,
                collection: true

      xml do
        element "named-content"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "alt", to: :alt
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "xlink:href", to: :xlink_href
        map_attribute "xlink:type", to: :xlink_type
        map_attribute "xlink:role", to: :xlink_role
        map_attribute "xlink:title", to: :xlink_title
        map_attribute "xlink:show", to: :xlink_show
        map_attribute "xlink:actuate", to: :xlink_actuate
        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "target", to: :target
        map_element "named-content", to: :named_content
        map_element "xref", to: :xref
        map_element "styled-content", to: :styled_content
        map_element "std", to: :std
        map_element "ext-link", to: :ext_link
        map_element "monospace", to: :monospace
        map_element "sc", to: :sc
        map_element "strike", to: :strike
        map_element "underline", to: :underline
      end
    end
  end
end

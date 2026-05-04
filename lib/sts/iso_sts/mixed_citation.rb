# frozen_string_literal: true

module Sts
  module IsoSts
    class MixedCitation < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :publication_type, :string
      attribute :publisher_type, :string
      attribute :publication_format, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::IsoSts::Bold, collection: true
      attribute :italic, ::Sts::IsoSts::Italic, collection: true
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :sup, ::Sts::NisoSts::Sup, collection: true
      attribute :std, ::Sts::IsoSts::Std, collection: true
      attribute :ext_link, ::Sts::NisoSts::ExtLink, collection: true
      attribute :uri, ::Sts::NisoSts::Uri, collection: true
      attribute :named_content, ::Sts::NisoSts::NamedContent, collection: true
      attribute :styled_content, ::Sts::IsoSts::StyledContent, collection: true
      attribute :fn, ::Sts::TbxIsoTml::Fn, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :break, ::Sts::IsoSts::Break, collection: true

      xml do
        element "mixed-citation"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "publication-type", to: :publication_type
        map_attribute "publisher-type", to: :publisher_type
        map_attribute "publication-format", to: :publication_format
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_content to: :content

        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "std", to: :std
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
        map_element "named-content", to: :named_content
        map_element "styled-content", to: :styled_content
        map_element "fn", to: :fn
        map_element "xref", to: :xref
        map_element "break", to: :break
      end
    end
  end
end

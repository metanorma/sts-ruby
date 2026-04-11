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
      attribute :content, :string
      attribute :bold, ::Sts::IsoSts::Bold
      attribute :italic, ::Sts::IsoSts::Italic
      attribute :sub, ::Sts::NisoSts::Sub
      attribute :sup, ::Sts::NisoSts::Sup
      attribute :std, ::Sts::IsoSts::Std
      attribute :ext_link, ::Sts::NisoSts::ExtLink
      attribute :uri, ::Sts::NisoSts::Uri, collection: true
      attribute :named_content, ::Sts::NisoSts::NamedContent
      attribute :styled_content, ::Sts::IsoSts::StyledContent
      attribute :fn, ::Sts::TbxIsoTml::Fn
      attribute :xref, ::Sts::TbxIsoTml::Xref
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

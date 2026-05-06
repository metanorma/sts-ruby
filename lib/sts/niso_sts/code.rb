# frozen_string_literal: true

module Sts
  module NisoSts
    class Code < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :code_type, :string
      attribute :code_version, :string
      attribute :executable, :string
      attribute :language, :string
      attribute :language_version, :string
      attribute :platforms, :string
      attribute :position, :string
      attribute :orientation, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :xml_space, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :sup, ::Sts::NisoSts::Sup, collection: true
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :named_content, ::Sts::NisoSts::NamedContent, collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :ext_link, ::Sts::NisoSts::ExtLink, collection: true
      attribute :uri, ::Sts::NisoSts::Uri, collection: true

      xml do
        element "code"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "code-type", to: :code_type
        map_attribute "code-version", to: :code_version
        map_attribute "executable", to: :executable
        map_attribute "language", to: :language
        map_attribute "language-version", to: :language_version
        map_attribute "platforms", to: :platforms
        map_attribute "position", to: :position
        map_attribute "orientation", to: :orientation
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "xml:space", to: :xml_space

        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sup", to: :sup
        map_element "sub", to: :sub
        map_element "named-content", to: :named_content
        map_element "styled-content", to: :styled_content
        map_element "xref", to: :xref
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
      end
    end

    class InlineCode < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :code_type, :string
      attribute :code_version, :string
      attribute :executable, :string
      attribute :language, :string
      attribute :language_version, :string
      attribute :platforms, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :sup, ::Sts::NisoSts::Sup, collection: true
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :named_content, ::Sts::NisoSts::NamedContent, collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :ext_link, ::Sts::NisoSts::ExtLink, collection: true
      attribute :uri, ::Sts::NisoSts::Uri, collection: true

      xml do
        element "inline-code"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "code-type", to: :code_type
        map_attribute "code-version", to: :code_version
        map_attribute "executable", to: :executable
        map_attribute "language", to: :language
        map_attribute "language-version", to: :language_version
        map_attribute "platforms", to: :platforms
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sup", to: :sup
        map_element "sub", to: :sub
        map_element "named-content", to: :named_content
        map_element "styled-content", to: :styled_content
        map_element "xref", to: :xref
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
      end
    end
  end
end

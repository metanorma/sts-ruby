# frozen_string_literal: true

module Sts
  module NisoSts
    class Preformat < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :preformat_type, :string
      attribute :xml_space, :string
      attribute :language, :string
      attribute :orientation, :string
      attribute :position, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :underline, ::Sts::NisoSts::Underline, collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent, collection: true
      attribute :std, ::Sts::NisoSts::ReferenceStandard, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :sup, ::Sts::NisoSts::Sup, collection: true
      attribute :sc, ::Sts::NisoSts::Sc, collection: true
      attribute :monospace, ::Sts::NisoSts::Monospace, collection: true
      attribute :ext_link, ::Sts::NisoSts::ExtLink, collection: true
      attribute :inline_formula, ::Sts::NisoSts::InlineFormula, collection: true
      attribute :break, ::Sts::NisoSts::Break, collection: true
      attribute :named_content, ::Sts::NisoSts::NamedContent,
                collection: true
      attribute :target, ::Sts::NisoSts::Target,
                collection: true

      xml do
        element "preformat"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "preformat-type", to: :preformat_type
        map_attribute "xml:space", to: :xml_space
        map_attribute "language", to: :language
        map_attribute "orientation", to: :orientation
        map_attribute "position", to: :position
        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "underline", to: :underline
        map_element "styled-content", to: :styled_content
        map_element "std", to: :std
        map_element "xref", to: :xref
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "sc", to: :sc
        map_element "monospace", to: :monospace
        map_element "ext-link", to: :ext_link
        map_element "inline-formula", to: :inline_formula
        map_element "break", to: :break
        map_element "named-content", to: :named_content
        map_element "target", to: :target
      end
    end
  end
end

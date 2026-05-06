# frozen_string_literal: true

module Sts
  module IsoSts
    class Bold < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :specific_use, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::IsoSts::Bold, collection: true
      attribute :italic, ::Sts::IsoSts::Italic, collection: true
      attribute :sub, ::Sts::IsoSts::Sub, collection: true
      attribute :sup, ::Sts::IsoSts::Sup, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :ext_link, ::Sts::IsoSts::ExtLink, collection: true
      attribute :uri, ::Sts::IsoSts::Uri, collection: true
      attribute :inline_formula, ::Sts::IsoSts::InlineFormula, collection: true
      attribute :named_content, ::Sts::IsoSts::NamedContent, collection: true
      attribute :styled_content, ::Sts::IsoSts::StyledContent, collection: true
      attribute :break, ::Sts::IsoSts::Break, collection: true
      attribute :std_ref, ::Sts::IsoSts::StdRef, collection: true
      attribute :monospace, ::Sts::IsoSts::Monospace, collection: true
      attribute :sc, ::Sts::IsoSts::Sc, collection: true
      attribute :strike, ::Sts::IsoSts::Strike, collection: true
      attribute :underline, ::Sts::IsoSts::Underline, collection: true
      attribute :fn, ::Sts::TbxIsoTml::Fn, collection: true

      xml do
        element "bold"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use

        map_content to: :content

        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "xref", to: :xref
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
        map_element "inline-formula", to: :inline_formula
        map_element "named-content", to: :named_content
        map_element "styled-content", to: :styled_content
        map_element "break", to: :break
        map_element "std-ref", to: :std_ref
        map_element "monospace", to: :monospace
        map_element "sc", to: :sc
        map_element "strike", to: :strike
        map_element "underline", to: :underline
        map_element "fn", to: :fn
      end
    end
  end
end

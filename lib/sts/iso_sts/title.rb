# frozen_string_literal: true

module Sts
  module IsoSts
    class Title < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::IsoSts::Bold, collection: true
      attribute :italic, ::Sts::IsoSts::Italic, collection: true
      attribute :sub, ::Sts::IsoSts::Sub, collection: true
      attribute :sup, ::Sts::IsoSts::Sup, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :break, ::Sts::IsoSts::Break, collection: true
      attribute :styled_content, ::Sts::IsoSts::StyledContent, collection: true
      attribute :monospace, ::Sts::IsoSts::Monospace, collection: true
      attribute :sc, ::Sts::IsoSts::Sc, collection: true
      attribute :inline_formula, ::Sts::IsoSts::InlineFormula, collection: true
      attribute :std, ::Sts::IsoSts::Std, collection: true

      xml do
        element "title"
        map_attribute "id", to: :id
        mixed_content

        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "xref", to: :xref
        map_element "break", to: :break
        map_element "styled-content", to: :styled_content
        map_element "monospace", to: :monospace
        map_element "sc", to: :sc
        map_element "inline-formula", to: :inline_formula
        map_element "std", to: :std
      end
    end
  end
end

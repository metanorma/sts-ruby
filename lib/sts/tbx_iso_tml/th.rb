# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Th < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :colspan, :string
      attribute :align, :string
      attribute :scope, :string
      attribute :style, :string
      attribute :rowspan, :string
      attribute :break, ::Sts::TbxIsoTml::TableBreak
      attribute :content_type, :string
      attribute :char, :string
      attribute :charoff, :string
      attribute :valign, :string
      attribute :abbr, :string
      attribute :axis, :string
      attribute :headers, :string
      attribute :id, :string
      attribute :italic, ::Sts::TbxIsoTml::Italic
      attribute :bold, ::Sts::TbxIsoTml::Bold
      attribute :std, ::Sts::NisoSts::ReferenceStandard
      attribute :xref, ::Sts::TbxIsoTml::Xref
      attribute :inline_formula, ::Sts::NisoSts::InlineFormula, collection: true
      attribute :paragraph, ::Sts::NisoSts::Paragraph
      attribute :fn, ::Sts::TbxIsoTml::Fn

      xml do
        element "th"
        mixed_content

        map_content to: :content
        map_attribute "colspan", to: :colspan
        map_attribute "align", to: :align
        map_attribute "scope", to: :scope
        map_attribute "style", to: :style
        map_attribute "rowspan", to: :rowspan
        map_attribute "content-type", to: :content_type
        map_attribute "char", to: :char, value_map: { to: { empty: :empty } }
        map_attribute "charoff", to: :charoff
        map_attribute "valign", to: :valign
        map_attribute "abbr", to: :abbr
        map_attribute "axis", to: :axis
        map_attribute "headers", to: :headers
        map_attribute "id", to: :id

        map_element "break", to: :break
        map_element "italic", to: :italic
        map_element "bold", to: :bold
        map_element "std", to: :std
        map_element "xref", to: :xref
        map_element "inline-formula", to: :inline_formula
        map_element "p", to: :paragraph
        map_element "fn", to: :fn
      end
    end
  end
end

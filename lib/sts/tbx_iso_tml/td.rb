# frozen_string_literal: true

require "lutaml/model"

require_relative "italic"
require_relative "xref"
require_relative "bold"
require_relative "../niso_sts/reference_standard"
require_relative "../niso_sts/inline_formula"
require_relative "../niso_sts/non_normative_note"
require_relative "../niso_sts/graphic"
require_relative "../niso_sts/def_list"
require_relative "../niso_sts/paragraph"

module Sts
  module TbxIsoTml
    class Td < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :align, :string
      attribute :scope, :string
      attribute :style, :string
      attribute :bold, Bold
      attribute :italic, Italic
      attribute :content_type, :string
      attribute :char, :string
      attribute :charoff, :string
      attribute :colspan, :string
      attribute :rowspan, :string
      attribute :valign, :string
      attribute :inline_formula, Sts::NisoSts::InlineFormula, collection: true
      attribute :non_normative_note,
                Sts::NisoSts::NonNormativeNote,
                collection: true
      attribute :list, Sts::NisoSts::List
      attribute :xref, Xref, collection: true
      attribute :std, Sts::NisoSts::ReferenceStandard
      attribute :graphic, Sts::NisoSts::Graphic
      attribute :def_list, Sts::NisoSts::DefList
      attribute :paragraph, Sts::NisoSts::Paragraph

      xml do
        root "td", mixed: true

        map_content to: :content

        map_attribute "align", to: :align
        map_attribute "scope", to: :scope
        map_attribute "style", to: :style
        map_attribute "content-type", to: :content_type
        map_attribute "char", to: :char, value_map: { to: { empty: :empty } }
        map_attribute "charoff", to: :charoff
        map_attribute "colspan", to: :colspan
        map_attribute "rowspan", to: :rowspan
        map_attribute "valign", to: :valign

        map_element "italic", to: :italic
        map_element "bold", to: :bold
        map_element "xref", to: :xref
        map_element "std", to: :std
        map_element "list", to: :list
        map_element "inline-formula", to: :inline_formula
        map_element "non-normative-note", to: :non_normative_note
        map_element "graphic", to: :graphic
        map_element "def-list", to: :def_list
        map_element "p", to: :paragraph
      end
    end
  end
end

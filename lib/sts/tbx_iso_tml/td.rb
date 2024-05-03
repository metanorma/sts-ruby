# frozen_string_literal: true

require_relative "../mapper"

require_relative "italic"
require_relative "xref"
require_relative "bold"
require_relative "../niso_sts/reference_standard"
require_relative "../niso_sts/inline_formula"
require_relative "../niso_sts/non_normative_note"
require_relative "../niso_sts/graphic"
require_relative "../niso_sts/def_list"

module Sts
  module TbxIsoTml
    class Td < Sts::Mapper
      attribute :content, Shale::Type::String
      attribute :align, Shale::Type::String
      attribute :bold, Bold
      attribute :italic, Italic
      attribute :content_type, Shale::Type::String
      attribute :char, Shale::Type::String
      attribute :charoff, Shale::Type::String
      attribute :colspan, Shale::Type::String
      attribute :rowspan, Shale::Type::String
      attribute :valign, Shale::Type::String
      attribute :inline_formula, Sts::NisoSts::InlineFormula
      attribute :non_normative_note, Sts::NisoSts::NonNormativeNote
      attribute :list, Sts::NisoSts::List
      attribute :xref, Xref
      attribute :std, Sts::NisoSts::ReferenceStandard
      attribute :graphic, Sts::NisoSts::Graphic
      attribute :def_list, Sts::NisoSts::DefList

      xml do
        root "tr"

        map_content to: :content

        map_attribute "align", to: :align
        map_attribute "content-type", to: :content_type
        map_attribute "char", to: :char
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
      end
    end
  end
end

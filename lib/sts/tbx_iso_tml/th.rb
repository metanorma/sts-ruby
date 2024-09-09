# frozen_string_literal: true

require_relative "../mapper"

require_relative "bold"
require_relative "italic"
require_relative "table_break"
require_relative "xref"
require_relative "../niso_sts/reference_standard"
require_relative "../niso_sts/inline_formula"

module Sts
  module TbxIsoTml
    class Th < Sts::Mapper
      attribute :content, Lutaml::Model::Type::String
      attribute :colspan, Lutaml::Model::Type::String
      attribute :align, Lutaml::Model::Type::String
      attribute :scope, Lutaml::Model::Type::String
      attribute :style, Lutaml::Model::Type::String
      attribute :rowspan, Lutaml::Model::Type::String
      attribute :break, TableBreak
      attribute :content_type, Lutaml::Model::Type::String
      attribute :char, Lutaml::Model::Type::String
      attribute :charoff, Lutaml::Model::Type::String
      attribute :valign, Lutaml::Model::Type::String
      attribute :italic, Italic
      attribute :bold, Bold
      attribute :std, Sts::NisoSts::ReferenceStandard
      attribute :xref, Xref
      attribute :inline_formula, Sts::NisoSts::InlineFormula, collection: true

      xml do
        root "th", mixed: true

        map_content to: :content
        map_attribute "colspan", to: :colspan
        map_attribute "align", to: :align
        map_attribute "scope", to: :scope
        map_attribute "style", to: :style
        map_attribute "rowspan", to: :rowspan
        map_attribute "content-type", to: :content_type
        map_attribute "char", to: :char
        map_attribute "charoff", to: :charoff
        map_attribute "valign", to: :valign

        map_element "break", to: :break
        map_element "italic", to: :italic
        map_element "bold", to: :bold
        map_element "std", to: :std
        map_element "xref", to: :xref
        map_element "inline-formula", to: :inline_formula
      end
    end
  end
end

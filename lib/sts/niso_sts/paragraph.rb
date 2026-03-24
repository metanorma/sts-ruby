# frozen_string_literal: true


module Sts
  module NisoSts

    class Paragraph < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :text, :string
      attribute :italic, :string, collection: true
      attribute :bold, :string, collection: true
      attribute :uri, :string
      attribute :list, ::Sts::NisoSts::List
      attribute :def_list, ::Sts::NisoSts::DefList
      attribute :non_normative_note, ::Sts::NisoSts::NonNormativeNote
      attribute :non_normative_example, ::Sts::NisoSts::NonNormativeExample
      attribute :inline_formula, ::Sts::NisoSts::InlineFormula, collection: true
      attribute :disp_formula, ::Sts::NisoSts::DisplayFormula, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :std, ::Sts::NisoSts::ReferenceStandard, collection: true
      attribute :ext_link, ::Sts::NisoSts::ExtLink
      attribute :entailed_term, ::Sts::TbxIsoTml::EntailedTerm

      xml do
        element "p"
        mixed_content

        map_attribute "id", to: :id
        map_content to: :text
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "list", to: :list
        map_element "def-list", to: :def_list
        map_element "non-normative-note", to: :non_normative_note
        map_element "non-normative-example", to: :non_normative_example
        map_element "inline-formula", to: :inline_formula
        map_element "disp-formula", to: :disp_formula
        map_element "ext-link", to: :ext_link
        map_element "entailedTerm", to: :entailed_term
        map_element "uri", to: :uri
        map_element "std", to: :std
        map_element "xref", to: :xref
      end
    end
  end
end

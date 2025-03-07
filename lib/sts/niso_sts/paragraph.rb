# frozen_string_literal: true

require "lutaml/model"

require_relative "list"
require_relative "inline_formula"
require_relative "display_formula"
require_relative "def_list"
require_relative "non_normative_note"
require_relative "non_normative_example"
require_relative "reference_standard"
require_relative "ext_link"
require_relative "../tbx_iso_tml/entailed_term"
require_relative "../tbx_iso_tml/xref"

module Sts
  module NisoSts
    class NonNormativeNote < Lutaml::Model::Serializable; end
    class ReferenceStandard < Lutaml::Model::Serializable; end

    class Paragraph < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :text, :string
      attribute :italic, :string, collection: true
      attribute :bold, :string, collection: true
      attribute :uri, :string
      attribute :list, Sts::NisoSts::List
      attribute :def_list, DefList
      attribute :non_normative_note, NonNormativeNote
      attribute :non_normative_example, NonNormativeExample
      attribute :inline_formula, Sts::NisoSts::InlineFormula, collection: true
      attribute :disp_formula, Sts::NisoSts::DisplayFormula, collection: true
      attribute :xref, TbxIsoTml::Xref, collection: true
      attribute :std, ReferenceStandard, collection: true
      attribute :ext_link, ExtLink
      attribute :entailed_term, Sts::TbxIsoTml::EntailedTerm

      xml do
        root "p", mixed: true

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
        map_element "entailedTerm", to: :entailed_term,
                                    namespace: "urn:iso:std:iso:30042:ed-1",
                                    prefix: "tbx"
        map_element "uri", to: :uri
        map_element "std", to: :std, namespace: nil, prefix: nil
        map_element "xref", to: :xref, namespace: nil, prefix: nil
      end
    end
  end
end

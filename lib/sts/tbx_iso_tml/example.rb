# frozen_string_literal: true

require "lutaml/model"
require_relative "entailed_term"

require_relative "../niso_sts/inline_formula"

module Sts
  module TbxIsoTml
    class Example < Lutaml::Model::Serializable
      attribute :id, Lutaml::Model::Type::String
      attribute :value, Lutaml::Model::Type::String
      attribute :entailed_term, EntailedTerm, collection: true
      attribute :inline_formula, Sts::NisoSts::InlineFormula

      xml do
        root "example", mixed: true
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_content to: :value

        map_attribute "id", to: :id

        map_element "entailedTerm", to: :entailed_term
        map_element "inline-formula", to: :inline_formula,
                                      namespace: nil,
                                      prefix: nil
      end
    end
  end
end

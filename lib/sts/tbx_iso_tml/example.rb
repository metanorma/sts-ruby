# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class Example < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :value, :string, collection: true
      attribute :entailed_term, ::Sts::TbxIsoTml::EntailedTerm, collection: true
      attribute :inline_formula, ::Sts::NisoSts::InlineFormula

      xml do
        element "example"
        mixed_content
        namespace ::Sts::Namespaces::TbxNamespace

        map_content to: :value

        map_attribute "id", to: :id

        map_element "entailedTerm", to: :entailed_term
        map_element "inline-formula", to: :inline_formula
      end
    end
  end
end

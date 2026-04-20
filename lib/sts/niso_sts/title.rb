# frozen_string_literal: true

module Sts
  module NisoSts
    class Title < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      attribute :inline_formula, Sts::NisoSts::InlineFormula, collection: true

      xml do
        element "title"
        mixed_content

        map_content to: :content
        map_element "inline-formula", to: :inline_formula
      end
    end
  end
end

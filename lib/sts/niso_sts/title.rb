# frozen_string_literal: true

require_relative "../mapper"

require_relative "section"
require_relative "inline_formula"

module Sts
  module NisoSts
    class Title < Sts::Mapper
      attribute :content, Lutaml::Model::Type::String
      attribute :inline_formula, Sts::NisoSts::InlineFormula, collection: true

      xml do
        root "title", mixed: true

        map_content to: :content
        map_element "inline-formula", to: :inline_formula
      end
    end
  end
end

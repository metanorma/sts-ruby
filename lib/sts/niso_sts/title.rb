# frozen_string_literal: true

require "lutaml/model"

require_relative "section"
require_relative "inline_formula"

module Sts
  module NisoSts
    class Title < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :inline_formula, Sts::NisoSts::InlineFormula, collection: true

      xml do
        root "title", mixed: true

        map_content to: :content
        map_element "inline-formula", to: :inline_formula
      end
    end
  end
end

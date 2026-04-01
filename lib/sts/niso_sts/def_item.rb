# frozen_string_literal: true

module Sts
  module NisoSts
    class DefItem < Lutaml::Model::Serializable
      attribute :specific_use, :string
      attribute :term, ::Sts::NisoSts::Term
      attribute :definition, ::Sts::NisoSts::Def

      xml do
        element "def-item"

        map_attribute "specific-use", to: :specific_use
        map_element "term", to: :term, render_nil: true
        map_element "def", to: :definition
      end
    end
  end
end

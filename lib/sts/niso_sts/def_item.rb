# frozen_string_literal: true

require_relative "../mapper"

require_relative "def"
require_relative "../tbx_iso_tml/term"

module Sts
  module NisoSts
    class DefItem < Sts::Mapper
      attribute :specific_use, Lutaml::Model::Type::String
      attribute :term, TbxIsoTml::Term
      attribute :definition, Def

      xml do
        root "def-item"

        map_attribute "specific-use", to: :specific_use
        map_element "term", to: :term, render_nil: true
        map_element "def", to: :definition
      end
    end
  end
end

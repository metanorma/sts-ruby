# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module TbxIsoTml
    class TermType < Sts::Mapper
      # TODO: can be:
      # - acronym
      # - abbreviation
      # - equation
      # - formula
      # - fullForm
      # - symbol
      # - variant

      attribute :value, Lutaml::Model::Type::String

      xml do
        root "termType"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "value", to: :value
      end
    end
  end
end

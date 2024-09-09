# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class NormativeAuthorization < Lutaml::Model::Serializable
      attribute :value, Lutaml::Model::Type::String,
        values: %w[admittedTerm preferredTerm deprecatedTerm]

      xml do
        root "normativeAuthorization"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "value", to: :value
      end
    end
  end
end

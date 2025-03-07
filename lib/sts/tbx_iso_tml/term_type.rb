# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class TermType < Lutaml::Model::Serializable
      attribute :value, :string,
                values: %w[acronym abbreviation equation formula fullForm symbol variant]

      xml do
        root "termType"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "value", to: :value
      end
    end
  end
end

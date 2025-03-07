# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class GrammaticalGender < Lutaml::Model::Serializable
      attribute :value, :string,
                values: %w[masculine feminine neuter]

      xml do
        root "grammaticalGender"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "value", to: :value
      end
    end
  end
end

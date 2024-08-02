# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module TbxIsoTml
    class GrammaticalNumber < Sts::Mapper
      # TODO: can be singular | plural
      attribute :value, Lutaml::Model::Type::String

      xml do
        root "grammaticalNumber"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute "value", to: :value
      end
    end
  end
end

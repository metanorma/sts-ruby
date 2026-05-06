# frozen_string_literal: true

module Sts
  module NisoSts
    class EquationCount < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :count, :integer

      xml do
        element "equation-count"
        map_attribute "id", to: :id
        map_attribute "count", to: :count
      end
    end
  end
end

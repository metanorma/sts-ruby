# frozen_string_literal: true

module Sts
  module NisoSts
    class EquationCount < Lutaml::Model::Serializable
      attribute :count, :integer

      xml do
        element "equation-count"
        map_attribute "count", to: :count
      end
    end
  end
end

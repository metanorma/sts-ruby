# frozen_string_literal: true

module Sts
  module NisoSts
    class FloatsGroup < Lutaml::Model::Serializable
      attribute :id, :string
      xml do
        element "floats-group"
        map_attribute "id", to: :id
        ordered
      end
    end
  end
end

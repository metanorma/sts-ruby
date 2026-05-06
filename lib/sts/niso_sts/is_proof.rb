# frozen_string_literal: true

module Sts
  module NisoSts
    class IsProof < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :is_proof, :string

      xml do
        element "is-proof"

        map_attribute "id", to: :id
        map_attribute "is-proof", to: :is_proof
      end
    end
  end
end

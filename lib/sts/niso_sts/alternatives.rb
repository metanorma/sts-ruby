# frozen_string_literal: true

module Sts
  module NisoSts
    class Alternatives < Lutaml::Model::Serializable
      attribute :id, :string
      xml do
        element "alternatives"
        map_attribute "id", to: :id
        ordered
      end
    end
  end
end

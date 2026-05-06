# frozen_string_literal: true

module Sts
  module NisoSts
    class Anonymous < Lutaml::Model::Serializable
      attribute :id, :string
      xml do
        element "anonymous"

        map_attribute "id", to: :id
      end
    end
  end
end

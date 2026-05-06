# frozen_string_literal: true

module Sts
  module NisoSts
    class OpenAccess < Lutaml::Model::Serializable
      attribute :id, :string
      xml do
        element "open-access"
        map_attribute "id", to: :id
        ordered
      end
    end
  end
end

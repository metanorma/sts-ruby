# frozen_string_literal: true

module Sts
  module NisoSts
    class ContribGroup < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :contrib, ::Sts::NisoSts::Contrib, collection: true
      attribute :role, ::Sts::NisoSts::Role, collection: true

      xml do
        element "contrib-group"

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id

        map_element "contrib", to: :contrib
        map_element "role", to: :role
      end
    end
  end
end

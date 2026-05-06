# frozen_string_literal: true

module Sts
  module NisoSts
    class CollabAlternatives < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :collab, ::Sts::NisoSts::Collab, collection: true

      xml do
        element "collab-alternatives"

        map_attribute "id", to: :id

        map_element "collab", to: :collab
      end
    end
  end
end

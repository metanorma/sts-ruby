# frozen_string_literal: true

module Sts
  module NisoSts
    class CollabAlternatives < Lutaml::Model::Serializable
      attribute :collab, ::Sts::NisoSts::Collab, collection: true

      xml do
        element "collab-alternatives"

        map_element "collab", to: :collab
      end
    end
  end
end

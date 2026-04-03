# frozen_string_literal: true

module Sts
  module NisoSts
    class AffAlternatives < Lutaml::Model::Serializable
      attribute :aff, ::Sts::NisoSts::Aff, collection: true

      xml do
        element "aff-alternatives"

        map_element "aff", to: :aff
      end
    end
  end
end

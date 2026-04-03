# frozen_string_literal: true

module Sts
  module NisoSts
    class NameAlternatives < Lutaml::Model::Serializable
      attribute :name, ::Sts::NisoSts::Name, collection: true

      xml do
        element "name-alternatives"

        map_element "name", to: :name
      end
    end
  end
end

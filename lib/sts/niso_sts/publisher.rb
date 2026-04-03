# frozen_string_literal: true

module Sts
  module NisoSts
    class Publisher < Lutaml::Model::Serializable
      attribute :publisher_name, ::Sts::NisoSts::PublisherName, collection: true
      attribute :publisher_loc, ::Sts::NisoSts::PublisherLoc, collection: true

      xml do
        element "publisher"

        map_element "publisher-name", to: :publisher_name
        map_element "publisher-loc", to: :publisher_loc
      end
    end
  end
end

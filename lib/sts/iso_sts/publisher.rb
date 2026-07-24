# frozen_string_literal: true

module Sts
  module IsoSts
    class Publisher < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :publisher_name, ::Sts::IsoSts::PublisherName, collection: true
      attribute :publisher_loc, ::Sts::IsoSts::PublisherLoc, collection: true

      xml do
        element "publisher"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type

        map_element "publisher-name", to: :publisher_name
        map_element "publisher-loc", to: :publisher_loc
      end
    end
  end
end

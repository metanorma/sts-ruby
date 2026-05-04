# frozen_string_literal: true

module Sts
  module NisoSts
    class AppGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :app, Sts::NisoSts::App, collection: true

      xml do
        element "app-group"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_element "app", to: :app
      end
    end
  end
end

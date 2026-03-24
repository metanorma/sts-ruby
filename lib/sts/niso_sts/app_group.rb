# frozen_string_literal: true


module Sts
  module NisoSts
    class AppGroup < Lutaml::Model::Serializable
      attribute :app, Sts::NisoSts::App, collection: true

      xml do
        element "app-group"

        map_element "app", to: :app
      end
    end
  end
end

# frozen_string_literal: true

require "lutaml/model"

require_relative "app"

module Sts
  module NisoSts
    class AppGroup < Lutaml::Model::Serializable
      attribute :app, Sts::NisoSts::App, collection: true

      xml do
        root "app-group"

        map_element "app", to: :app
      end
    end
  end
end

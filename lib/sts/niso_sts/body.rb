# frozen_string_literal: true

require "lutaml/model"

require_relative "section"

module Sts
  module NisoSts
    class Body < Lutaml::Model::Serializable
      attribute :sec, Section, collection: true

      xml do
        root "body"
        map_element "sec", to: :sec
      end
    end
  end
end

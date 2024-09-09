# frozen_string_literal: true

require "lutaml/model"

require_relative "label"
require_relative "paragraph"

module Sts
  module NisoSts
    class Fn < Lutaml::Model::Serializable
      attribute :id, Lutaml::Model::Type::String
      attribute :label, Label
      attribute :paragraph, Paragraph

      xml do
        root "fn"

        map_attribute "id", to: :id

        map_element "label", to: :label
        map_element "p", to: :paragraph
      end
    end
  end
end

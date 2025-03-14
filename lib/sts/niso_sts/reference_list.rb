# frozen_string_literal: true

require_relative "reference"

module Sts
  module NisoSts
    class ReferenceList < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :specific_use, :string
      attribute :title, :string
      attribute :label, Label
      attribute :ref, Reference, collection: true

      xml do
        root "ref-list"

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_element "title", to: :title
        map_element "label", to: :label
        map_element "ref", to: :ref
      end
    end
  end
end

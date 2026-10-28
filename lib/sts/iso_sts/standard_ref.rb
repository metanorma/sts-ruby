# frozen_string_literal: true

module Sts
  module IsoSts
    class StandardRef < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :type, :string
      attribute :value, :string

      xml do
        element "std-ref"
        map_attribute "id", to: :id
        map_attribute "type", to: :type
        map_content to: :value
      end
    end
  end
end

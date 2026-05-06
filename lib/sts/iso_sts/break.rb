# frozen_string_literal: true

module Sts
  module IsoSts
    class Break < Lutaml::Model::Serializable
      attribute :id, :string
      xml do
        element "break"

        map_attribute "id", to: :id
      end
    end
  end
end

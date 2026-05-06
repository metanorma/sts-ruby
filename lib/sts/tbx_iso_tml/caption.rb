# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Caption < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :p, :string

      xml do
        element "caption"

        map_attribute "id", to: :id

        map_element "p", to: :p
      end
    end
  end
end

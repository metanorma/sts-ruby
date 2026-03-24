# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Caption < Lutaml::Model::Serializable
      attribute :p, :string

      xml do
        element "caption"

        map_element "p", to: :p
      end
    end
  end
end

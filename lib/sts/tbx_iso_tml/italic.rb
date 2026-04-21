# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Italic < Lutaml::Model::Serializable
      attribute :value, :string, collection: true
      attribute :sub, :string

      xml do
        element "italic"
        mixed_content

        map_content to: :value
        map_element "sub", to: :sub
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module NisoSts
    class Rp < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :id, :string

      xml do
        element "rp"
        mixed_content

        map_content to: :content
        map_attribute "id", to: :id
      end
    end
  end
end

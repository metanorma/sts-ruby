# frozen_string_literal: true

module Sts
  module IsoSts
    class TexMath < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :id, :string
      attribute :content_type, :string
      attribute :notation, :string
      attribute :version, :string

      xml do
        element "tex-math"

        map_content to: :content
        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "notation", to: :notation
        map_attribute "version", to: :version
      end
    end
  end
end

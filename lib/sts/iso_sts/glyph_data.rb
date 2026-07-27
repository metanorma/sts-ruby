# frozen_string_literal: true

module Sts
  module IsoSts
    class GlyphData < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :fontchar, :string
      attribute :fontname, :string
      attribute :format, :string
      attribute :resolution, :string
      attribute :xml_space, :string
      attribute :x_size, :string
      attribute :y_size, :string
      attribute :content, :string, collection: true

      xml do
        element "glyph-data"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "fontchar", to: :fontchar
        map_attribute "fontname", to: :fontname
        map_attribute "format", to: :format
        map_attribute "resolution", to: :resolution
        map_attribute "xml:space", to: :xml_space
        map_attribute "x-size", to: :x_size
        map_attribute "y-size", to: :y_size
        map_content to: :content
      end
    end
  end
end

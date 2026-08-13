# frozen_string_literal: true

module Sts
  module IsoSts
    class GlyphRef < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :glyph_data, :string

      xml do
        element "glyph-ref"

        map_attribute "id", to: :id
        map_attribute "glyph-data", to: :glyph_data
      end
    end
  end
end

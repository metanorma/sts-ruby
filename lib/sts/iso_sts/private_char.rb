# frozen_string_literal: true

module Sts
  module IsoSts
    class PrivateChar < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :description, :string
      attribute :name, :string
      attribute :specific_use, :string
      attribute :glyph_data, ::Sts::IsoSts::GlyphData
      attribute :glyph_ref, ::Sts::IsoSts::GlyphRef
      attribute :inline_graphic, ::Sts::IsoSts::InlineGraphic, collection: true

      xml do
        element "private-char"
        ordered

        map_attribute "id", to: :id
        map_attribute "description", to: :description
        map_attribute "name", to: :name
        map_attribute "specific-use", to: :specific_use
        map_element "glyph-data", to: :glyph_data
        map_element "glyph-ref", to: :glyph_ref
        map_element "inline-graphic", to: :inline_graphic
      end
    end
  end
end

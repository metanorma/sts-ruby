# frozen_string_literal: true

module Sts
  module IsoSts
    class Alternatives < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :originator, :string
      attribute :array, ::Sts::IsoSts::Array, collection: true
      attribute :chem_struct, ::Sts::IsoSts::ChemStruct, collection: true
      attribute :graphic, ::Sts::IsoSts::Graphic, collection: true
      attribute :inline_graphic, ::Sts::IsoSts::InlineGraphic, collection: true
      attribute :inline_supplementary_material, ::Sts::IsoSts::InlineSupplementaryMaterial,
                collection: true
      attribute :media, ::Sts::IsoSts::Media, collection: true
      attribute :preformat, ::Sts::IsoSts::Preformat, collection: true
      attribute :private_char, ::Sts::IsoSts::PrivateChar, collection: true
      attribute :supplementary_material, ::Sts::IsoSts::SupplementaryMaterial,
                collection: true
      attribute :table, ::Sts::IsoSts::Table, collection: true
      attribute :textual_form, ::Sts::IsoSts::TextualForm, collection: true
      attribute :math, ::Mml::V2::Math, collection: true

      xml do
        element "alternatives"
        ordered

        map_attribute "id", to: :id
        map_attribute "originator", to: :originator
        map_element "array", to: :array
        map_element "chem-struct", to: :chem_struct
        map_element "graphic", to: :graphic
        map_element "inline-graphic", to: :inline_graphic
        map_element "inline-supplementary-material",
                    to: :inline_supplementary_material
        map_element "media", to: :media
        map_element "preformat", to: :preformat
        map_element "private-char", to: :private_char
        map_element "supplementary-material", to: :supplementary_material
        map_element "table", to: :table
        map_element "textual-form", to: :textual_form
        map_element "math", to: :math
      end
    end
  end
end

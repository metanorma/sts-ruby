# frozen_string_literal: true

module Sts
  module NisoSts
    class Legend < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      attribute :title, ::Sts::NisoSts::Title
      attribute :p, ::Sts::NisoSts::Paragraph, collection: true
      attribute :list, ::Sts::NisoSts::List, collection: true
      attribute :def_list, ::Sts::NisoSts::DefList, collection: true
      attribute :graphic, ::Sts::NisoSts::Graphic, collection: true
      attribute :supplementary_material,
                ::Sts::NisoSts::SupplementaryMaterial, collection: true

      xml do
        element "legend"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_content to: :content
        map_element "title", to: :title
        map_element "p", to: :p
        map_element "list", to: :list
        map_element "def-list", to: :def_list
        map_element "graphic", to: :graphic
        map_element "supplementary-material",
                    to: :supplementary_material
      end
    end
  end
end

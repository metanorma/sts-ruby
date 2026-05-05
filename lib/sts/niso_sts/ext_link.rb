# frozen_string_literal: true

module Sts
  module NisoSts
    class ExtLink < Lutaml::Model::Serializable
      attribute :ext_link_type, :string
      attribute :href, :xlink_href
      attribute :xlink_type, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :sup, ::Sts::NisoSts::Sup, collection: true
      attribute :inline_formula, ::Sts::NisoSts::InlineFormula, collection: true

      xml do
        element "ext-link"
        mixed_content

        map_content to: :content

        map_attribute "ext-link-type", to: :ext_link_type
        map_attribute "href", to: :href
        map_attribute "xlink:type", to: :xlink_type

        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "inline-formula", to: :inline_formula
      end
    end
  end
end

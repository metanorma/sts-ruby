# frozen_string_literal: true

module Sts
  module NisoSts
    class ExtLink < Lutaml::Model::Serializable
      attribute :assigning_authority, :string
      attribute :ext_link_type, :string
      attribute :id, :string
      attribute :specific_use, :string
      attribute :href, :xlink_href
      attribute :xlink_type, :string
      attribute :xlink_role, :string
      attribute :xlink_title, :string
      attribute :xlink_show, :string
      attribute :xlink_actuate, :string
      attribute :xml_lang, :string
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

        map_attribute "assigning-authority", to: :assigning_authority
        map_attribute "ext-link-type", to: :ext_link_type
        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_attribute "href", to: :href
        map_attribute "xlink:type", to: :xlink_type
        map_attribute "xlink:role", to: :xlink_role
        map_attribute "xlink:title", to: :xlink_title
        map_attribute "xlink:show", to: :xlink_show
        map_attribute "xlink:actuate", to: :xlink_actuate
        map_attribute "xml:lang", to: :xml_lang

        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "inline-formula", to: :inline_formula
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class TableWrap < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :orientation, :string
      attribute :position, :string
      attribute :label, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content_type, :string
      attribute :originator, :string
      attribute :table, ::Sts::TbxIsoTml::Table, collection: true
      attribute :graphic, ::Sts::NisoSts::Graphic, collection: true
      attribute :table_wrap_foot, ::Sts::TbxIsoTml::TableWrapFoot

      attribute :caption, ::Sts::NisoSts::Caption

      xml do
        element "table-wrap"
        ordered

        map_attribute "id", to: :id
        map_attribute "orientation", to: :orientation
        map_attribute "position", to: :position
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "content-type", to: :content_type
        map_attribute "originator", to: :originator

        map_element "label", to: :label
        map_element "caption", to: :caption
        map_element "table", to: :table
        map_element "graphic", to: :graphic
        map_element "table-wrap-foot", to: :table_wrap_foot
      end
    end
  end
end

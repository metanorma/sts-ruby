# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Table < Lutaml::Model::Serializable
      attribute :col, ::Sts::TbxIsoTml::Col, collection: true
      attribute :thead, ::Sts::TbxIsoTml::Thead
      attribute :tbody, ::Sts::TbxIsoTml::Tbody
      attribute :tfoot, ::Sts::TbxIsoTml::Tfoot
      attribute :colgroup, ::Sts::TbxIsoTml::Colgroup, collection: true
      attribute :tr, ::Sts::TbxIsoTml::Tr, collection: true
      attribute :border, :string
      attribute :rules, :string
      attribute :frame, :string
      attribute :width, :string
      attribute :id, :string
      attribute :content_type, :string
      attribute :style, :string
      attribute :summary, :string
      attribute :cellspacing, :string
      attribute :cellpadding, :string

      xml do
        element "table"
        ordered

        map_attribute "border", to: :border
        map_attribute "rules", to: :rules
        map_attribute "frame", to: :frame
        map_attribute "width", to: :width
        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "style", to: :style
        map_attribute "summary", to: :summary
        map_attribute "cellspacing", to: :cellspacing
        map_attribute "cellpadding", to: :cellpadding

        map_element "col", to: :col
        map_element "thead", to: :thead
        map_element "tbody", to: :tbody
        map_element "tfoot", to: :tfoot
        map_element "colgroup", to: :colgroup
        map_element "tr", to: :tr
      end
    end
  end
end

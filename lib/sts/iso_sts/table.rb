# frozen_string_literal: true

module Sts
  module IsoSts
    class Table < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :style, :string
      attribute :summary, :string
      attribute :width, :string
      attribute :border, :string
      attribute :frame, :string
      attribute :rules, :string
      attribute :cellspacing, :string
      attribute :cellpadding, :string
      attribute :col, ::Sts::IsoSts::Col, collection: true
      attribute :colgroup, ::Sts::IsoSts::Colgroup, collection: true
      attribute :thead, ::Sts::IsoSts::Thead
      attribute :tfoot, ::Sts::IsoSts::Tfoot
      attribute :tbody, ::Sts::IsoSts::Tbody, collection: true
      attribute :tr, ::Sts::IsoSts::Tr, collection: true

      xml do
        element "table"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "style", to: :style
        map_attribute "summary", to: :summary
        map_attribute "width", to: :width
        map_attribute "border", to: :border
        map_attribute "frame", to: :frame
        map_attribute "rules", to: :rules
        map_attribute "cellspacing", to: :cellspacing
        map_attribute "cellpadding", to: :cellpadding

        map_element "col", to: :col
        map_element "colgroup", to: :colgroup
        map_element "thead", to: :thead
        map_element "tfoot", to: :tfoot
        map_element "tbody", to: :tbody
        map_element "tr", to: :tr
      end
    end
  end
end

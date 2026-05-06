# frozen_string_literal: true

module Sts
  module NisoSts
    class TableWrapGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :position, :string
      attribute :orientation, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :caption, ::Sts::NisoSts::Caption
      attribute :table_wrap, ::Sts::TbxIsoTml::TableWrap, collection: true

      xml do
        element "table-wrap-group"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "position", to: :position
        map_attribute "orientation", to: :orientation
        map_element "label", to: :label
        map_element "caption", to: :caption
        map_element "table-wrap", to: :table_wrap
      end
    end
  end
end

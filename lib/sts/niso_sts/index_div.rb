# frozen_string_literal: true

module Sts
  module NisoSts
    class IndexDiv < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :index_title_group, ::Sts::NisoSts::IndexTitleGroup
      attribute :p, ::Sts::NisoSts::Paragraph, collection: true
      attribute :index_entry, ::Sts::NisoSts::IndexEntry, collection: true
      attribute :index_div, ::Sts::NisoSts::IndexDiv, collection: true

      xml do
        element "index-div"
        ordered

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_element "index-title-group", to: :index_title_group
        map_element "p", to: :p
        map_element "index-entry", to: :index_entry
        map_element "index-div", to: :index_div
      end
    end
  end
end

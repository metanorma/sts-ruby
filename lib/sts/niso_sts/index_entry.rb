# frozen_string_literal: true

module Sts
  module NisoSts
    class IndexEntry < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :sort_key, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :term, :string
      attribute :index_entry, ::Sts::NisoSts::IndexEntry, collection: true
      attribute :see_entry, ::Sts::NisoSts::SeeEntry, collection: true
      attribute :see_also_entry, ::Sts::NisoSts::SeeAlsoEntry, collection: true

      xml do
        element "index-entry"
        ordered

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "sort-key", to: :sort_key
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_element "term", to: :term
        map_element "index-entry", to: :index_entry
        map_element "see-entry", to: :see_entry
        map_element "see-also-entry", to: :see_also_entry
      end
    end
  end
end

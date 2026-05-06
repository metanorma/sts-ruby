# frozen_string_literal: true

module Sts
  module NisoSts
    class TocEntry < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :title, ::Sts::NisoSts::Title, collection: true
      attribute :subtitle, ::Sts::NisoSts::Subtitle, collection: true
      attribute :toc_entry, ::Sts::NisoSts::TocEntry, collection: true

      xml do
        element "toc-entry"
        ordered

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_element "label", to: :label
        map_element "title", to: :title
        map_element "subtitle", to: :subtitle
        map_element "toc-entry", to: :toc_entry
      end
    end
  end
end

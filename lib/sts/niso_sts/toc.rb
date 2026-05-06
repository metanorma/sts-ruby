# frozen_string_literal: true

module Sts
  module NisoSts
    class Toc < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :toc_title_group, ::Sts::NisoSts::TocTitleGroup
      attribute :p, ::Sts::NisoSts::Paragraph, collection: true
      attribute :toc_entry, ::Sts::NisoSts::TocEntry, collection: true
      attribute :toc_div, ::Sts::NisoSts::TocDiv, collection: true
      attribute :fn_group, ::Sts::NisoSts::FnGroup, collection: true

      xml do
        element "toc"
        ordered

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_element "toc-title-group", to: :toc_title_group
        map_element "p", to: :p
        map_element "toc-entry", to: :toc_entry
        map_element "toc-div", to: :toc_div
        map_element "fn-group", to: :fn_group
      end
    end
  end
end

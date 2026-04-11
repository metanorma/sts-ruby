# frozen_string_literal: true

module Sts
  module IsoSts
    class RefList < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :originator, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :title, ::Sts::IsoSts::Title
      attribute :paragraph, ::Sts::IsoSts::Paragraph, collection: true
      attribute :ref, ::Sts::IsoSts::Ref, collection: true
      attribute :ref_list, ::Sts::IsoSts::RefList, collection: true

      xml do
        element "ref-list"

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "originator", to: :originator

        map_element "label", to: :label
        map_element "title", to: :title
        map_element "p", to: :paragraph
        map_element "ref", to: :ref
        map_element "ref-list", to: :ref_list
      end
    end
  end
end

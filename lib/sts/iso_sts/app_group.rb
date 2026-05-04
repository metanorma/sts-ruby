# frozen_string_literal: true

module Sts
  module IsoSts
    class AppGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :title, ::Sts::IsoSts::Title
      attribute :paragraph, ::Sts::IsoSts::Paragraph, collection: true
      attribute :app, ::Sts::IsoSts::App, collection: true
      attribute :ref_list, ::Sts::IsoSts::RefList, collection: true

      xml do
        element "app-group"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_element "label", to: :label
        map_element "title", to: :title
        map_element "p", to: :paragraph
        map_element "app", to: :app
        map_element "ref-list", to: :ref_list
      end
    end
  end
end

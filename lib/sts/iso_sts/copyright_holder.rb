# frozen_string_literal: true

module Sts
  module IsoSts
    class CopyrightHolder < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      attribute :sub, ::Sts::IsoSts::Sub
      attribute :sup, ::Sts::IsoSts::Sup

      xml do
        element "copyright-holder"
        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        mixed_content

        map_content to: :content
        map_element "sub", to: :sub
        map_element "sup", to: :sup
      end
    end
  end
end

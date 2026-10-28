# frozen_string_literal: true

module Sts
  module IsoSts
    class IssueId < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :pub_id_type, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true

      xml do
        element "issue-id"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "pub-id-type", to: :pub_id_type
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_content to: :content
      end
    end
  end
end

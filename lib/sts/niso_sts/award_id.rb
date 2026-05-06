# frozen_string_literal: true

module Sts
  module NisoSts
    class AwardId < Lutaml::Model::Serializable
      attribute :award_id_type, :string
      attribute :id, :string
      attribute :rid, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      xml do
        element "award-id"
        mixed_content

        map_attribute "award-id-type", to: :award_id_type
        map_attribute "id", to: :id
        map_attribute "rid", to: :rid
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_content to: :content
      end
    end
  end
end

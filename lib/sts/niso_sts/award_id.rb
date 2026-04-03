# frozen_string_literal: true

module Sts
  module NisoSts
    class AwardId < Lutaml::Model::Serializable
      attribute :award_id_type, :string
      attribute :rid, :string
      attribute :content, :string

      xml do
        element "award-id"
        mixed_content

        map_attribute "award-id-type", to: :award_id_type
        map_attribute "rid", to: :rid
        map_content to: :content
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module NisoSts
    class MilestoneEnd < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :rid, :string
      attribute :content_type, :string
      attribute :rationale, :string
      attribute :specific_use, :string
      xml do
        element "milestone-end"
        ordered

        map_attribute "id", to: :id
        map_attribute "rid", to: :rid
        map_attribute "content-type", to: :content_type
        map_attribute "rationale", to: :rationale
        map_attribute "specific-use", to: :specific_use
      end
    end
  end
end

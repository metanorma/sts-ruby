# frozen_string_literal: true

module Sts
  module NisoSts
    class VolumeIssueGroup < Lutaml::Model::Serializable
      attribute :id, :string
      xml do
        element "volume-issue-group"
        map_attribute "id", to: :id
        ordered
      end
    end
  end
end

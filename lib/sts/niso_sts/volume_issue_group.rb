# frozen_string_literal: true

module Sts
  module NisoSts
    class VolumeIssueGroup < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      xml do
        element "volume-issue-group"
        mixed_content

        map_content to: :content
      end
    end
  end
end

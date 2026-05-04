# frozen_string_literal: true

module Sts
  module NisoSts
    class VolumeIssueGroup < Lutaml::Model::Serializable
      xml do
        element "volume-issue-group"
        ordered
      end
    end
  end
end

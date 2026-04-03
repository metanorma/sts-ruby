# frozen_string_literal: true

module Sts
  module NisoSts
    class StdOrgName < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "std-org-name"
        mixed_content

        map_content to: :content
      end
    end
  end
end

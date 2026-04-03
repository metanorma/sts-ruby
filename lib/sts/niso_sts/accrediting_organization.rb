# frozen_string_literal: true

module Sts
  module NisoSts
    class AccreditingOrganization < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "accrediting-organization"
        mixed_content

        map_content to: :content
      end
    end
  end
end

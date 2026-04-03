# frozen_string_literal: true

module Sts
  module NisoSts
    class StdOrganization < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "std-organization"
        mixed_content

        map_content to: :content
      end
    end
  end
end

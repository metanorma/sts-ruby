# frozen_string_literal: true

module Sts
  module NisoSts
    class StdOrgAbbrev < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "std-org-abbrev"
        mixed_content

        map_content to: :content
      end
    end
  end
end

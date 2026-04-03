# frozen_string_literal: true

module Sts
  module NisoSts
    class StdOrgLoc < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "std-org-loc"
        mixed_content

        map_content to: :content
      end
    end
  end
end

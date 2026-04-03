# frozen_string_literal: true

module Sts
  module NisoSts
    class Urn < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "urn"
        mixed_content

        map_content to: :content
      end
    end
  end
end

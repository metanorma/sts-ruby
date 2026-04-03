# frozen_string_literal: true

module Sts
  module NisoSts
    class OpenAccess < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "open-access"
        mixed_content

        map_content to: :content
      end
    end
  end
end

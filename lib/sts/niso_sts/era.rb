# frozen_string_literal: true

module Sts
  module NisoSts
    class Era < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "era"
        mixed_content

        map_content to: :content
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module NisoSts
    class Alternatives < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "alternatives"
        mixed_content

        map_content to: :content
      end
    end
  end
end

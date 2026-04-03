# frozen_string_literal: true

module Sts
  module NisoSts
    class Attribution < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "attribution"
        mixed_content

        map_content to: :content
      end
    end
  end
end

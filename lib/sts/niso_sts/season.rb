# frozen_string_literal: true

module Sts
  module NisoSts
    class Season < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "season"
        mixed_content

        map_content to: :content
      end
    end
  end
end

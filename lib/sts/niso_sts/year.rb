# frozen_string_literal: true

module Sts
  module NisoSts
    class Year < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "year"
        mixed_content

        map_content to: :content
      end
    end
  end
end

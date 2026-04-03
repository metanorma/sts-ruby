# frozen_string_literal: true

module Sts
  module NisoSts
    class PartOfSpeech < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "part-of-speech"
        mixed_content

        map_content to: :content
      end
    end
  end
end

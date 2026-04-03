# frozen_string_literal: true

module Sts
  module NisoSts
    class Speaker < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "speaker"
        mixed_content

        map_content to: :content
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module NisoSts
    class AltText < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      xml do
        element "alt-text"
        mixed_content

        map_content to: :content
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module NisoSts
    class Version < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      xml do
        element "version"
        mixed_content

        map_content to: :content
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module NisoSts
    class Main < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      xml do
        element "main"
        mixed_content

        map_content to: :content
      end
    end
  end
end

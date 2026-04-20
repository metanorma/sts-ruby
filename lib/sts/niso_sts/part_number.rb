# frozen_string_literal: true

module Sts
  module NisoSts
    class PartNumber < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      xml do
        element "part-number"
        mixed_content

        map_content to: :content
      end
    end
  end
end

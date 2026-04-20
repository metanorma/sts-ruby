# frozen_string_literal: true

module Sts
  module IsoSts
    class CommRef < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      xml do
        element "comm-ref"
        mixed_content

        map_content to: :content
      end
    end
  end
end

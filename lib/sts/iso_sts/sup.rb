# frozen_string_literal: true

module Sts
  module IsoSts
    class Sup < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      xml do
        element "sup"
        mixed_content

        map_content to: :content
      end
    end
  end
end

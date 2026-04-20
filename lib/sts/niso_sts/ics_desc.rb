# frozen_string_literal: true

module Sts
  module NisoSts
    class IcsDesc < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      xml do
        element "ics-desc"
        mixed_content

        map_content to: :content
      end
    end
  end
end

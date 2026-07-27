# frozen_string_literal: true

module Sts
  module IsoSts
    class MetaName < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string

      xml do
        element "meta-name"

        map_attribute "id", to: :id
        map_content to: :content
      end
    end
  end
end

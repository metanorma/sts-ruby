# frozen_string_literal: true

module Sts
  module NisoSts
    class StringConf < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string, collection: true
      xml do
        element "string-conf"
        map_attribute "id", to: :id
        mixed_content

        map_content to: :content
      end
    end
  end
end

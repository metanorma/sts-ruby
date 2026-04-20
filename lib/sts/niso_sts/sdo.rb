# frozen_string_literal: true

module Sts
  module NisoSts
    class Sdo < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      xml do
        element "sdo"
        mixed_content

        map_content to: :content
      end
    end
  end
end

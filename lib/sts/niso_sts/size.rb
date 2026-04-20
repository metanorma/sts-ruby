# frozen_string_literal: true

module Sts
  module NisoSts
    class Size < Lutaml::Model::Serializable
      attribute :units, :string
      attribute :content, :string, collection: true
      xml do
        element "size"
        mixed_content

        map_attribute "units", to: :units
        map_content to: :content
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module IsoSts
    class Num < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :dsep, :string
      attribute :gsep, :string
      attribute :specific_use, :string
      attribute :content, :string, collection: true

      xml do
        element "num"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "dsep", to: :dsep
        map_attribute "gsep", to: :gsep
        map_attribute "specific-use", to: :specific_use
        map_content to: :content
      end
    end
  end
end

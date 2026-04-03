# frozen_string_literal: true

module Sts
  module NisoSts
    class Sub < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :specific_use, :string
      attribute :content, :string

      xml do
        element "sub"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_content to: :content
      end
    end
  end
end

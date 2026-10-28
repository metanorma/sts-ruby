# frozen_string_literal: true

module Sts
  module IsoSts
    class GivenNames < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :initials, :string
      attribute :content, :string, collection: true

      xml do
        element "given-names"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "initials", to: :initials
        map_content to: :content
      end
    end
  end
end

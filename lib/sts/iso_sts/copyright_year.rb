# frozen_string_literal: true

module Sts
  module IsoSts
    class CopyrightYear < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string

      xml do
        element "copyright-year"

        map_attribute "id", to: :id

        map_content to: :content
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module NisoSts
    class FundingStatement < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :rid, :string
      attribute :content, :string

      xml do
        element "funding-statement"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "rid", to: :rid
        map_content to: :content
      end
    end
  end
end

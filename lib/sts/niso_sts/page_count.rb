# frozen_string_literal: true

module Sts
  module NisoSts
    class PageCount < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :count, :integer

      xml do
        element "page-count"
        map_attribute "id", to: :id
        map_attribute "count", to: :count
      end
    end
  end
end

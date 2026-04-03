# frozen_string_literal: true

module Sts
  module NisoSts
    class SupplType < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "suppl-type"
        mixed_content

        map_content to: :content
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module NisoSts
    class SupplNumber < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      xml do
        element "suppl-number"
        mixed_content

        map_content to: :content
      end
    end
  end
end

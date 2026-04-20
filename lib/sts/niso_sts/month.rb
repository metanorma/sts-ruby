# frozen_string_literal: true

module Sts
  module NisoSts
    class Month < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      xml do
        element "month"
        mixed_content

        map_content to: :content
      end
    end
  end
end

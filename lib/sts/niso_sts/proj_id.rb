# frozen_string_literal: true

module Sts
  module NisoSts
    class ProjId < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "proj-id"
        mixed_content

        map_content to: :content
      end
    end
  end
end

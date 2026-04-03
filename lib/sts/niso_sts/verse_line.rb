# frozen_string_literal: true

module Sts
  module NisoSts
    class VerseLine < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "verse-line"
        mixed_content

        map_content to: :content
      end
    end
  end
end

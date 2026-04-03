# frozen_string_literal: true

module Sts
  module NisoSts
    class AltTitle < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "alt-title"
        mixed_content

        map_content to: :content
      end
    end
  end
end

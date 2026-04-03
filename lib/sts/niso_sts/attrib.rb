# frozen_string_literal: true

module Sts
  module NisoSts
    class Attrib < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "attrib"
        mixed_content

        map_content to: :content
      end
    end
  end
end

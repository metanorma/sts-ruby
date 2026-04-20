# frozen_string_literal: true

module Sts
  module NisoSts
    class Intro < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      xml do
        element "intro"
        mixed_content

        map_content to: :content
      end
    end
  end
end

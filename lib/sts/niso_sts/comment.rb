# frozen_string_literal: true

module Sts
  module NisoSts
    class Comment < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "comment"
        mixed_content

        map_content to: :content
      end
    end
  end
end

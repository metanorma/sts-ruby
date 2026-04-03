# frozen_string_literal: true

module Sts
  module NisoSts
    class DocType < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "doc-type"
        mixed_content

        map_content to: :content
      end
    end
  end
end

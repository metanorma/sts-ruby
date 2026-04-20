# frozen_string_literal: true

module Sts
  module NisoSts
    class TermSource < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      xml do
        element "term-source"
        mixed_content

        map_content to: :content
      end
    end
  end
end

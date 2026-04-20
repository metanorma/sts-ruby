# frozen_string_literal: true

module Sts
  module IsoSts
    class Sub < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      xml do
        element "sub"
        mixed_content

        map_content to: :content
      end
    end
  end
end

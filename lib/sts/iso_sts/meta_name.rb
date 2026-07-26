# frozen_string_literal: true

module Sts
  module IsoSts
    class MetaName < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "meta-name"
        map_content to: :content
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module NisoSts
    class MetaDate < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :type, :string

      xml do
        element "meta-date"

        map_content to: :content

        map_attribute :type, to: :type
      end
    end
  end
end

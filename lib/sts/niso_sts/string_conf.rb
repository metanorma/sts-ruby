# frozen_string_literal: true

module Sts
  module NisoSts
    class StringConf < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "string-conf"
        mixed_content

        map_content to: :content
      end
    end
  end
end

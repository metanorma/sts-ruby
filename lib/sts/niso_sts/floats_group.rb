# frozen_string_literal: true

module Sts
  module NisoSts
    class FloatsGroup < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "floats-group"
        mixed_content

        map_content to: :content
      end
    end
  end
end

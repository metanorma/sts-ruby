# frozen_string_literal: true

module Sts
  module NisoSts
    class TexMath < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "tex-math"
        mixed_content

        map_content to: :content
      end
    end
  end
end

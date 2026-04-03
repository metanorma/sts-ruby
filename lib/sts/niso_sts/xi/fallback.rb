# frozen_string_literal: true

module Sts
  module NisoSts
    module Xi
      class Fallback < Lutaml::Model::Serializable
        attribute :content, :string

        xml do
          element "xi:fallback"
          mixed_content

          map_content to: :content
        end
      end
    end
  end
end

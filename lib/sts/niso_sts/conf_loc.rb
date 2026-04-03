# frozen_string_literal: true

module Sts
  module NisoSts
    class ConfLoc < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "conf-loc"
        mixed_content

        map_content to: :content
      end
    end
  end
end

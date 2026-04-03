# frozen_string_literal: true

module Sts
  module NisoSts
    class ConfTheme < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "conf-theme"
        mixed_content

        map_content to: :content
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module NisoSts
    class CopyrightStatement < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "copyright-statement"
        mixed_content

        map_content to: :content
      end
    end
  end
end

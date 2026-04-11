# frozen_string_literal: true

module Sts
  module IsoSts
    class CopyrightYear < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "copyright-year"

        map_content to: :content
      end
    end
  end
end

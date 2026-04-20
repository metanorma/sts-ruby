# frozen_string_literal: true

module Sts
  module NisoSts
    class CopyrightHolder < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      xml do
        element "copyright-holder"
        mixed_content

        map_content to: :content
      end
    end
  end
end

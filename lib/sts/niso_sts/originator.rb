# frozen_string_literal: true

module Sts
  module NisoSts
    class Originator < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "originator"
        mixed_content

        map_content to: :content
      end
    end
  end
end

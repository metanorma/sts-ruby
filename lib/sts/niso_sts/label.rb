# frozen_string_literal: true

module Sts
  module NisoSts
    class Label < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      attribute :sup, Sts::TbxIsoTml::Sup, collection: true

      xml do
        element "label"
        mixed_content

        map_content to: :content
        map_element "sup", to: :sup
      end
    end
  end
end

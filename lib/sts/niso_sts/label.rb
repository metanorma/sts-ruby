# frozen_string_literal: true


module Sts
  module NisoSts
    class Label < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :sup, Sts::TbxIsoTml::Sup

      xml do
        element "label"

        map_content to: :content
        map_element "sup", to: :sup
      end
    end
  end
end

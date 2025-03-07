# frozen_string_literal: true

require "lutaml/model"

module Sts
  module NisoSts
    class StdId < Lutaml::Model::Serializable
      attribute :std_id_link_type, :string
      attribute :std_id_type, :string
      attribute :specific_use, :string
      attribute :content, :string

      xml do
        root "std-id"

        map_attribute "std-id-link-type", to: :std_id_link_type
        map_attribute "std-id-type", to: :std_id_type
        map_attribute "specific-use", to: :specific_use

        map_content to: :content
      end
    end
  end
end

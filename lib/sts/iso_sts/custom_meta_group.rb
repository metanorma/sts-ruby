# frozen_string_literal: true

module Sts
  module IsoSts
    class CustomMetaGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :custom_meta, ::Sts::IsoSts::CustomMeta, collection: true

      xml do
        element "custom-meta-group"
        ordered

        map_attribute "id", to: :id
        map_element "custom-meta", to: :custom_meta
      end
    end
  end
end

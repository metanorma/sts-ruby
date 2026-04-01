# frozen_string_literal: true

module Sts
  module NisoSts
    class CustomMetaGroup < Lutaml::Model::Serializable
      attribute :custom_meta, ::Sts::NisoSts::CustomMeta, collection: true

      xml do
        element "custom-meta-group"

        map_element "custom-meta", to: :custom_meta
      end
    end
  end
end

# frozen_string_literal: true

require "lutaml/model"

require_relative "custom_meta"

module Sts
  module NisoSts
    class CustomMetaGroup < Lutaml::Model::Serializable
      attribute :custom_meta, CustomMeta, collection: true

      xml do
        root "custom-meta-group"

        map_element "custom-meta", to: :custom_meta
      end
    end
  end
end

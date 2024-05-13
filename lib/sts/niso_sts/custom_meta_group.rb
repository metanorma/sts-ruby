# frozen_string_literal: true

require_relative "../mapper"

require_relative "custom_meta"

module Sts
  module NisoSts
    class CustomMetaGroup < Sts::Mapper
      attribute :custom_meta, CustomMeta, collection: true

      xml do
        root "custom-meta-group"

        map_element "custom-meta", to: :custom_meta
      end
    end
  end
end

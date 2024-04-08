# frozen_string_literal: true

require "shale"

require_relative "custom_meta"

module Sts
  module NisoSts
    class CustomMetaGroup < Shale::Mapper
      attribute :custom_meta, CustomMeta, collection: true

      xml do
        root "custom-meta-group"
        map_attribute "custom-meta", to: :custom_meta
      end
    end
  end
end

# frozen_string_literal: true

require "shale"

require_relative "metadata_iso"
require_relative "metadata_std"

module Sts
  module NisoSts
    class Front < Shale::Mapper
      attribute :iso_meta, MetadataIso
      attribute :std_meta, MetadataStd
      attribute :sec, Section, collection: true

      xml do
        root "front"
        map_element "iso-meta", to: :iso_meta
        map_element "std-meta", to: :std_meta
        map_element "sec", to: :sec
      end
    end
  end
end

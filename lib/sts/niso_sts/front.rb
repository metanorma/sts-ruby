# frozen_string_literal: true

require "shale"

require_relative "metadata_iso"

module Sts
  module NisoSts
    class Front < Shale::Mapper
      attribute :iso_meta, MetadataIso

      xml do
        root "front"
        map_element "iso-meta", to: :iso_meta
      end
    end
  end
end

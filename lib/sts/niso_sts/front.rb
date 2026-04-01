# frozen_string_literal: true

module Sts
  module NisoSts
    class Front < Lutaml::Model::Serializable
      attribute :iso_meta, ::Sts::NisoSts::MetadataIso
      attribute :std_meta, ::Sts::NisoSts::MetadataStd
      attribute :sec, ::Sts::NisoSts::Section, collection: true

      xml do
        element "front"
        map_element "iso-meta", to: :iso_meta
        map_element "std-meta", to: :std_meta
        map_element "sec", to: :sec
      end
    end
  end
end

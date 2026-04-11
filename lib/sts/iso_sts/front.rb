# frozen_string_literal: true

module Sts
  module IsoSts
    class Front < Lutaml::Model::Serializable
      attribute :iso_meta, ::Sts::IsoSts::IsoMeta
      attribute :reg_meta, ::Sts::IsoSts::RegMeta, collection: true
      attribute :nat_meta, ::Sts::IsoSts::NatMeta, collection: true
      attribute :sec, ::Sts::IsoSts::Sec, collection: true

      xml do
        element "front"

        map_element "iso-meta", to: :iso_meta
        map_element "reg-meta", to: :reg_meta
        map_element "nat-meta", to: :nat_meta
        map_element "sec", to: :sec
      end
    end
  end
end

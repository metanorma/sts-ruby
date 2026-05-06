# frozen_string_literal: true

module Sts
  module NisoSts
    class Front < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :iso_meta, ::Sts::NisoSts::MetadataIso
      attribute :std_meta, ::Sts::NisoSts::MetadataStd
      attribute :std_doc_meta, ::Sts::NisoSts::StdDocMeta
      attribute :reg_meta, ::Sts::NisoSts::RegMeta
      attribute :nat_meta, ::Sts::NisoSts::NatMeta
      attribute :sec, ::Sts::NisoSts::Section, collection: true
      attribute :ack, ::Sts::NisoSts::Ack, collection: true
      attribute :notes, ::Sts::NisoSts::Notes, collection: true
      attribute :toc, ::Sts::NisoSts::Toc, collection: true

      xml do
        element "front"
        ordered

        map_attribute "id", to: :id
        map_element "iso-meta", to: :iso_meta
        map_element "std-meta", to: :std_meta
        map_element "std-doc-meta", to: :std_doc_meta
        map_element "reg-meta", to: :reg_meta
        map_element "nat-meta", to: :nat_meta
        map_element "sec", to: :sec
        map_element "ack", to: :ack
        map_element "notes", to: :notes
        map_element "toc", to: :toc
      end
    end
  end
end

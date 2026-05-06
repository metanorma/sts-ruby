# frozen_string_literal: true

module Sts
  module NisoSts
    class SecMeta < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :xml_base, :string
      attribute :contrib_group, ::Sts::NisoSts::ContribGroup, collection: true
      attribute :abstract, ::Sts::NisoSts::Abstract, collection: true
      attribute :kwd_group, ::Sts::NisoSts::KwdGroup, collection: true
      attribute :permissions, ::Sts::NisoSts::Permissions

      xml do
        element "sec-meta"

        map_attribute "id", to: :id
        map_attribute "xml:base", to: :xml_base

        map_element "contrib-group", to: :contrib_group
        map_element "abstract", to: :abstract
        map_element "kwd-group", to: :kwd_group
        map_element "permissions", to: :permissions
      end
    end
  end
end

# frozen_string_literal: true

require "lutaml/model"
require_relative "standard_ref"
require_relative "std_id_group"
require_relative "fn"
require_relative "../tbx_iso_tml/xref"

module Sts
  module NisoSts
    class ReferenceStandard < Lutaml::Model::Serializable
      attribute :type, :string
      attribute :std_id, :string
      attribute :content, :string
      attribute :std_ref, StandardRef
      attribute :title, :string
      attribute :fn, Fn, collection: true
      attribute :std_id_group, StdIdGroup, collection: true
      attribute :xref, Sts::TbxIsoTml::Xref, collection: true

      xml do
        root "std", mixed: true

        map_attribute "type", to: :type
        map_attribute "std-id", to: :std_id

        map_element "std-ref", to: :std_ref, namespace: nil, prefix: nil
        map_element "fn", to: :fn, namespace: nil, prefix: nil
        map_element "title", to: :title, namespace: nil, prefix: nil
        map_element "std-id-group", to: :std_id_group,
                                    namespace: nil,
                                    prefix: nil
        map_element "xref", to: :xref

        map_content to: :content
      end
    end
  end
end

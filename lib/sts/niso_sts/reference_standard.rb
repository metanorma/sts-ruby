# frozen_string_literal: true

require_relative "../mapper"
require_relative "standard_ref"
require_relative "std_id_group"
require_relative "../tbx_iso_tml/xref"

module Sts
  module NisoSts
    class ReferenceStandard < Sts::Mapper
      attribute :type, Shale::Type::String
      attribute :std_id, Shale::Type::String
      attribute :content, Shale::Type::String
      attribute :std_ref, StandardRef
      attribute :title, Shale::Type::String
      attribute :std_id_group, StdIdGroup, collection: true
      attribute :xref, Sts::TbxIsoTml::Xref, collection: true

      xml do
        root "std"

        map_attribute "type", to: :type
        map_attribute "std-id", to: :std_id
        map_element "std-ref", to: :std_ref, namespace: nil, prefix: nil
        map_element "title", to: :title, namespace: nil, prefix: nil
        map_element "std-id-group", to: :std_id_group, namespace: nil, prefix: nil
        map_element "xref", to: :xref

        map_content to: :content
      end
    end
  end
end

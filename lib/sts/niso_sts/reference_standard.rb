# frozen_string_literal: true

module Sts
  module NisoSts
    class ReferenceStandard < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :type, :string
      attribute :std_id, :string
      attribute :content, :string, collection: true
      attribute :std_ref, ::Sts::NisoSts::StandardRef, collection: true
      attribute :title, :string
      attribute :fn, ::Sts::NisoSts::Fn, collection: true
      attribute :std_id_group, ::Sts::NisoSts::StdIdGroup, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true

      xml do
        element "std"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "type", to: :type
        map_attribute "std-id", to: :std_id

        map_element "std-ref", to: :std_ref
        map_element "fn", to: :fn
        map_element "title", to: :title
        map_element "std-id-group", to: :std_id_group
        map_element "xref", to: :xref
        map_element "bold", to: :bold

        map_content to: :content
      end
    end
  end
end

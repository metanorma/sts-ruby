# frozen_string_literal: true

module Sts
  module NisoSts
    class RestrictedBy < Lutaml::Model::Serializable
      attribute :content, :string, collection: true

      xml do
        element "restricted-by"
        mixed_content
        map_content to: :content
      end
    end

    class ExtendedBy < Lutaml::Model::Serializable
      attribute :content, :string, collection: true

      xml do
        element "extended-by"
        mixed_content
        map_content to: :content
      end
    end

    class ProcessingMeta < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :tagset_family, :string
      attribute :base_tagset, :string
      attribute :table_model, :string
      attribute :math_representation, :string
      attribute :mathml_version, :string
      attribute :terminology_model, :string
      attribute :restricted_by, ::Sts::NisoSts::RestrictedBy,
                collection: true
      attribute :extended_by, ::Sts::NisoSts::ExtendedBy, collection: true
      attribute :custom_meta_group, ::Sts::NisoSts::CustomMetaGroup

      xml do
        element "processing-meta"

        map_attribute "id", to: :id
        map_attribute "tagset-family", to: :tagset_family
        map_attribute "base-tagset", to: :base_tagset
        map_attribute "table-model", to: :table_model
        map_attribute "math-representation", to: :math_representation
        map_attribute "mathml-version", to: :mathml_version
        map_attribute "terminology-model", to: :terminology_model
        map_element "restricted-by", to: :restricted_by
        map_element "extended-by", to: :extended_by
        map_element "custom-meta-group", to: :custom_meta_group
      end
    end
  end
end

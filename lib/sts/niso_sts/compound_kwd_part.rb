# frozen_string_literal: true

module Sts
  module NisoSts
    class CompoundKwdPart < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :kwd_part_type, :string
      attribute :value, :string
      attribute :content, :string, collection: true
      attribute :named_content, ::Sts::NisoSts::NamedContent,
                collection: true
      attribute :target, ::Sts::NisoSts::Target,
                collection: true
      xml do
        element "compound-kwd-part"
        mixed_content

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "kwd-part-type", to: :kwd_part_type
        map_attribute "value", to: :value
        map_content to: :content
        map_element "named-content", to: :named_content
        map_element "target", to: :target
      end
    end
  end
end

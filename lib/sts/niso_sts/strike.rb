# frozen_string_literal: true

module Sts
  module NisoSts
    class Strike < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :specific_use, :string
      attribute :toggle, :string
      attribute :content, :string, collection: true
      attribute :named_content, ::Sts::NisoSts::NamedContent,
                collection: true
      attribute :target, ::Sts::NisoSts::Target,
                collection: true
      xml do
        element "strike"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_attribute "toggle", to: :toggle
        map_content to: :content
        map_element "named-content", to: :named_content
        map_element "target", to: :target
      end
    end
  end
end

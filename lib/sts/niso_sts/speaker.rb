# frozen_string_literal: true

module Sts
  module NisoSts
    class Speaker < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string, collection: true
      attribute :named_content, ::Sts::NisoSts::NamedContent,
                collection: true
      attribute :target, ::Sts::NisoSts::Target,
                collection: true
      xml do
        element "speaker"
        map_attribute "id", to: :id
        mixed_content

        map_content to: :content
        map_element "named-content", to: :named_content
        map_element "target", to: :target
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module NisoSts
    class TitleFull < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      attribute :std, ::Sts::NisoSts::ReferenceStandard
      attribute :named_content, ::Sts::NisoSts::NamedContent,
                collection: true
      attribute :target, ::Sts::NisoSts::Target,
                collection: true

      xml do
        element "full"
        mixed_content

        map_content to: :content
        map_element "std", to: :std
        map_element "named-content", to: :named_content
        map_element "target", to: :target
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module IsoSts
    class Strike < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :specific_use, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::IsoSts::Bold, collection: true
      attribute :italic, ::Sts::IsoSts::Italic, collection: true
      attribute :sub, ::Sts::IsoSts::Sub, collection: true
      attribute :sup, ::Sts::IsoSts::Sup, collection: true
      attribute :named_content, ::Sts::IsoSts::NamedContent,
                collection: true
      attribute :target, ::Sts::IsoSts::Target,
                collection: true

      xml do
        element "strike"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "named-content", to: :named_content
        map_element "target", to: :target
      end
    end
  end
end

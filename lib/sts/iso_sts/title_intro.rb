# frozen_string_literal: true

module Sts
  module IsoSts
    class TitleIntro < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::IsoSts::Bold
      attribute :italic, ::Sts::IsoSts::Italic
      attribute :xref, ::Sts::TbxIsoTml::Xref
      attribute :named_content, ::Sts::IsoSts::NamedContent,
                collection: true
      attribute :target, ::Sts::IsoSts::Target,
                collection: true

      xml do
        element "intro"
        map_attribute "id", to: :id
        mixed_content

        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "xref", to: :xref
        map_element "named-content", to: :named_content
        map_element "target", to: :target
      end
    end
  end
end

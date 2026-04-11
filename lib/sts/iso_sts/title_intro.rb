# frozen_string_literal: true

module Sts
  module IsoSts
    class TitleIntro < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :bold, ::Sts::IsoSts::Bold
      attribute :italic, ::Sts::IsoSts::Italic
      attribute :xref, ::Sts::TbxIsoTml::Xref

      xml do
        element "intro"
        mixed_content

        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "xref", to: :xref
      end
    end
  end
end

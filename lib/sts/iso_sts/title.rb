# frozen_string_literal: true

module Sts
  module IsoSts
    class Title < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      attribute :bold, ::Sts::IsoSts::Bold
      attribute :italic, ::Sts::IsoSts::Italic
      attribute :sub, ::Sts::NisoSts::Sub
      attribute :sup, ::Sts::NisoSts::Sup
      attribute :xref, ::Sts::TbxIsoTml::Xref
      attribute :break, ::Sts::IsoSts::Break
      attribute :styled_content, ::Sts::IsoSts::StyledContent

      xml do
        element "title"
        mixed_content

        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "xref", to: :xref
        map_element "break", to: :break
        map_element "styled-content", to: :styled_content
      end
    end
  end
end

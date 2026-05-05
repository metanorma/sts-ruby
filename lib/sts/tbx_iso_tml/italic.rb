# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class Italic < Lutaml::Model::Serializable
      attribute :value, :string, collection: true
      attribute :bold, ::Sts::TbxIsoTml::Bold, collection: true
      attribute :sub, ::Sts::NisoSts::Sub, collection: true
      attribute :sup, ::Sts::NisoSts::Sup, collection: true
      attribute :monospace, ::Sts::NisoSts::Monospace, collection: true
      attribute :sc, ::Sts::NisoSts::Sc, collection: true
      attribute :std_ref, ::Sts::NisoSts::StandardRef, collection: true
      attribute :underline, ::Sts::NisoSts::Underline, collection: true
      attribute :strike, ::Sts::NisoSts::Strike, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true
      attribute :ext_link, ::Sts::NisoSts::ExtLink, collection: true
      attribute :fn, ::Sts::NisoSts::Fn, collection: true
      attribute :styled_content, ::Sts::NisoSts::StyledContent, collection: true
      attribute :italic, ::Sts::TbxIsoTml::Italic, collection: true

      xml do
        element "italic"
        mixed_content

        map_content to: :value
        map_element "bold", to: :bold
        map_element "sub", to: :sub
        map_element "sup", to: :sup
        map_element "monospace", to: :monospace
        map_element "sc", to: :sc
        map_element "std-ref", to: :std_ref
        map_element "underline", to: :underline
        map_element "strike", to: :strike
        map_element "xref", to: :xref
        map_element "ext-link", to: :ext_link
        map_element "fn", to: :fn
        map_element "styled-content", to: :styled_content
        map_element "italic", to: :italic
      end
    end
  end
end

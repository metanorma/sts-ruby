# frozen_string_literal: true

module Sts
  module IsoSts
    class Std < Lutaml::Model::Serializable
      attribute :type, :string
      attribute :std_id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :std_ref, ::Sts::IsoSts::StdRef
      attribute :title, ::Sts::IsoSts::Title
      attribute :fn, ::Sts::TbxIsoTml::Fn, collection: true
      attribute :xref, ::Sts::TbxIsoTml::Xref
      attribute :bold, ::Sts::IsoSts::Bold
      attribute :italic, ::Sts::IsoSts::Italic
      attribute :named_content, ::Sts::NisoSts::NamedContent
      attribute :content, :string, collection: true
      xml do
        element "std"
        mixed_content

        map_attribute "type", to: :type
        map_attribute "std-id", to: :std_id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang

        map_element "std-ref", to: :std_ref
        map_element "title", to: :title
        map_element "fn", to: :fn
        map_element "xref", to: :xref
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "named-content", to: :named_content
        map_content to: :content
      end
    end
  end
end

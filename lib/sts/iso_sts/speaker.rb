# frozen_string_literal: true

module Sts
  module IsoSts
    class Speaker < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content, :string, collection: true
      attribute :degrees, ::Sts::IsoSts::Degrees, collection: true
      attribute :given_names, ::Sts::IsoSts::GivenNames, collection: true
      attribute :prefix, ::Sts::IsoSts::Prefix, collection: true
      attribute :surname, ::Sts::IsoSts::Surname, collection: true
      attribute :suffix, ::Sts::IsoSts::Suffix, collection: true
      attribute :fn, ::Sts::IsoSts::Fn, collection: true
      attribute :target, ::Sts::IsoSts::Target, collection: true
      attribute :entailed_term, ::Sts::TbxIsoTml::EntailedTerm, collection: true
      attribute :xref, ::Sts::IsoSts::Xref, collection: true

      xml do
        element "speaker"
        mixed_content

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_content to: :content
        map_element "degrees", to: :degrees
        map_element "given-names", to: :given_names
        map_element "prefix", to: :prefix
        map_element "surname", to: :surname
        map_element "suffix", to: :suffix
        map_element "fn", to: :fn
        map_element "target", to: :target
        map_element "entailedTerm", to: :entailed_term
        map_element "xref", to: :xref
      end
    end
  end
end

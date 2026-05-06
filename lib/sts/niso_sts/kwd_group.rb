# frozen_string_literal: true

module Sts
  module NisoSts
    class KwdGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :kwd_group_type, :string
      attribute :xml_lang, :string
      attribute :specific_use, :string
      attribute :vocab, :string
      attribute :vocab_identifier, :string
      attribute :vocab_term, :string
      attribute :vocab_term_identifier, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :title, ::Sts::NisoSts::Title
      attribute :kwd, ::Sts::NisoSts::Kwd, collection: true
      attribute :nested_kwd, ::Sts::NisoSts::NestedKwd, collection: true
      attribute :compound_kwd, ::Sts::NisoSts::CompoundKwd, collection: true
      attribute :unstructured_kwd_group, ::Sts::NisoSts::UnstructuredKwdGroup,
                collection: true

      xml do
        element "kwd-group"
        ordered

        map_attribute "id", to: :id
        map_attribute "kwd-group-type", to: :kwd_group_type
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "specific-use", to: :specific_use
        map_attribute "vocab", to: :vocab
        map_attribute "vocab-identifier", to: :vocab_identifier
        map_attribute "vocab-term", to: :vocab_term
        map_attribute "vocab-term-identifier", to: :vocab_term_identifier

        map_element "label", to: :label
        map_element "title", to: :title
        map_element "kwd", to: :kwd
        map_element "nested-kwd", to: :nested_kwd
        map_element "compound-kwd", to: :compound_kwd
        map_element "unstructured-kwd-group", to: :unstructured_kwd_group
      end
    end
  end
end

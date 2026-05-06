# frozen_string_literal: true

module Sts
  module NisoSts
    class SubjGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :subj_group_type, :string
      attribute :xml_lang, :string
      attribute :specific_use, :string
      attribute :vocab, :string
      attribute :vocab_identifier, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :subject, ::Sts::NisoSts::Subject, collection: true
      attribute :compound_subject, ::Sts::NisoSts::CompoundSubject,
                collection: true
      attribute :subj_group, ::Sts::NisoSts::SubjGroup, collection: true

      xml do
        element "subj-group"

        map_attribute "id", to: :id
        map_attribute "subj-group-type", to: :subj_group_type
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "specific-use", to: :specific_use
        map_attribute "vocab", to: :vocab
        map_attribute "vocab-identifier", to: :vocab_identifier

        map_element "label", to: :label
        map_element "subject", to: :subject
        map_element "compound-subject", to: :compound_subject
        map_element "subj-group", to: :subj_group
      end
    end
  end
end

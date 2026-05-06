# frozen_string_literal: true

module Sts
  module NisoSts
    class CompoundSubject < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :specific_use, :string
      attribute :vocab_term, :string
      attribute :vocab_term_identifier, :string
      attribute :xml_base, :string
      attribute :compound_subject_part, ::Sts::NisoSts::CompoundSubjectPart,
                collection: true

      xml do
        element "compound-subject"

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_attribute "vocab-term", to: :vocab_term
        map_attribute "vocab-term-identifier", to: :vocab_term_identifier
        map_attribute "xml:base", to: :xml_base

        map_element "compound-subject-part", to: :compound_subject_part
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class TermInformationGroup < Lutaml::Model::Serializable
      attribute :term, ::Sts::TbxIsoTml::Term
      attribute :pos, ::Sts::TbxIsoTml::PartOfSpeech
      attribute :id, :string
      attribute :usage_note, :string
      attribute :normative_authorization, ::Sts::TbxIsoTml::NormativeAuthorization
      attribute :geographical_usage, ::Sts::TbxIsoTml::GeographicalUsage
      attribute :grammatical_gender, ::Sts::TbxIsoTml::GrammaticalGender
      attribute :grammatical_number, ::Sts::TbxIsoTml::GrammaticalNumber
      attribute :pronunciation, ::Sts::TbxIsoTml::Pronunciation
      attribute :term_type, ::Sts::TbxIsoTml::TermType

      xml do
        element "tig"
        mixed_content
        namespace ::Sts::Namespaces::TbxNamespace

        map_attribute "id", to: :id

        map_element "term", to: :term
        map_element "partOfSpeech", to: :pos
        map_element "usageNote", to: :usage_note
        map_element "normativeAuthorization", to: :normative_authorization
        map_element "geographicalUsage", to: :geographical_usage
        map_element "pronunciation", to: :pronunciation
        map_element "termType", to: :term_type
        map_element "grammaticalGender", to: :grammatical_gender
        map_element "grammaticalNumber", to: :grammatical_number
      end
    end
  end
end

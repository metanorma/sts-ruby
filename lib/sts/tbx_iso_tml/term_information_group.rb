# frozen_string_literal: true

require "lutaml/model"

require_relative "term"
require_relative "part_of_speech"
require_relative "normative_authorization"
require_relative "geographical_usage"
require_relative "grammatical_gender"
require_relative "grammatical_number"
require_relative "term_type"

module Sts
  module TbxIsoTml
    class TermInformationGroup < Lutaml::Model::Serializable
      attribute :term, Term
      attribute :pos, PartOfSpeech
      attribute :id, :string
      attribute :usage_note, :string
      attribute :normative_authorization, NormativeAuthorization
      attribute :geographical_usage, GeographicalUsage
      attribute :grammatical_gender, GrammaticalGender
      attribute :grammatical_number, GrammaticalNumber
      attribute :pronunciation, :string
      attribute :term_type, TermType

      xml do
        root "tig", mixed: true
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

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

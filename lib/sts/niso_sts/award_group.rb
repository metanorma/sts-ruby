# frozen_string_literal: true

module Sts
  module NisoSts
    class AwardGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :award_type, :string
      attribute :funding_source, ::Sts::NisoSts::FundingSource, collection: true
      attribute :award_id, ::Sts::NisoSts::AwardId, collection: true
      attribute :principal_award_recipient, ::Sts::NisoSts::PrincipalAwardRecipient
      attribute :principal_investigator, ::Sts::NisoSts::PrincipalInvestigator

      xml do
        element "award-group"

        map_attribute "id", to: :id
        map_attribute "award-type", to: :award_type

        map_element "funding-source", to: :funding_source
        map_element "award-id", to: :award_id
        map_element "principal-award-recipient", to: :principal_award_recipient
        map_element "principal-investigator", to: :principal_investigator
      end
    end
  end
end

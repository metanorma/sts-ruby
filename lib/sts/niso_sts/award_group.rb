# frozen_string_literal: true

module Sts
  module NisoSts
    class AwardGroup < Lutaml::Model::Serializable
      attribute :award_type, :string
      attribute :id, :string
      attribute :rid, :string
      attribute :specific_use, :string
      attribute :xlink_href, :string
      attribute :xlink_role, :string
      attribute :xlink_title, :string
      attribute :xlink_show, :string
      attribute :xlink_actuate, :string
      attribute :xml_lang, :string
      attribute :funding_source, ::Sts::NisoSts::FundingSource, collection: true
      attribute :award_id, ::Sts::NisoSts::AwardId, collection: true
      attribute :principal_award_recipient,
                ::Sts::NisoSts::PrincipalAwardRecipient, collection: true
      attribute :principal_investigator, ::Sts::NisoSts::PrincipalInvestigator,
                collection: true

      xml do
        element "award-group"
        ordered

        map_attribute "award-type", to: :award_type
        map_attribute "id", to: :id
        map_attribute "rid", to: :rid
        map_attribute "specific-use", to: :specific_use
        map_attribute "xlink:href", to: :xlink_href
        map_attribute "xlink:role", to: :xlink_role
        map_attribute "xlink:title", to: :xlink_title
        map_attribute "xlink:show", to: :xlink_show
        map_attribute "xlink:actuate", to: :xlink_actuate
        map_attribute "xml:lang", to: :xml_lang

        map_element "funding-source", to: :funding_source
        map_element "award-id", to: :award_id
        map_element "principal-award-recipient", to: :principal_award_recipient
        map_element "principal-investigator", to: :principal_investigator
      end
    end
  end
end

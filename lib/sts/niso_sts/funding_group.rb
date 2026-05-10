# frozen_string_literal: true

module Sts
  module NisoSts
    class FundingGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :funding_source, ::Sts::NisoSts::FundingSource, collection: true
      attribute :award_group, ::Sts::NisoSts::AwardGroup, collection: true
      attribute :funding_statement, ::Sts::NisoSts::FundingStatement,
                collection: true

      xml do
        element "funding-group"
        ordered

        map_attribute "id", to: :id

        map_element "funding-source", to: :funding_source
        map_element "award-group", to: :award_group
        map_element "funding-statement", to: :funding_statement
      end
    end
  end
end

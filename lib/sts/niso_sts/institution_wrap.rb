# frozen_string_literal: true

module Sts
  module NisoSts
    class InstitutionWrap < Lutaml::Model::Serializable
      attribute :institution, ::Sts::NisoSts::Institution
      attribute :institution_id, ::Sts::NisoSts::InstitutionId

      xml do
        element "institution-wrap"

        map_element "institution", to: :institution
        map_element "institution-id", to: :institution_id
      end
    end
  end
end

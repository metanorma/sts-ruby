# frozen_string_literal: true

module Sts
  module NisoSts
    class StdOrgGroup < Lutaml::Model::Serializable
      attribute :std_org, ::Sts::NisoSts::StdOrg, collection: true

      xml do
        element "std-org-group"

        map_element "std-org", to: :std_org
      end
    end
  end
end

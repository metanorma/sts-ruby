# frozen_string_literal: true

module Sts
  module NisoSts
    class StdOrg < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :std_org_type, :string
      attribute :std_org_role, :string
      attribute :std_org_name, ::Sts::NisoSts::StdOrgName
      attribute :std_org_abbrev, ::Sts::NisoSts::StdOrgAbbrev, collection: true
      attribute :std_org_loc, ::Sts::NisoSts::StdOrgLoc, collection: true

      xml do
        element "std-org"
        ordered

        map_attribute "id", to: :id
        map_attribute "std-org-type", to: :std_org_type
        map_attribute "std-org-role", to: :std_org_role
        map_element "std-org-name", to: :std_org_name
        map_element "std-org-abbrev", to: :std_org_abbrev
        map_element "std-org-loc", to: :std_org_loc
      end
    end
  end
end

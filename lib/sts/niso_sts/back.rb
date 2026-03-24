# frozen_string_literal: true


module Sts
  module NisoSts
    class Back < Lutaml::Model::Serializable
      attribute :ref_list, ::Sts::NisoSts::ReferenceList
      attribute :app_group, ::Sts::NisoSts::AppGroup
      attribute :sec, ::Sts::NisoSts::Section
      attribute :fn_group, ::Sts::NisoSts::FnGroup

      xml do
        element "back"

        map_element "ref-list", to: :ref_list
        map_element "app-group", to: :app_group
        map_element "sec", to: :sec
        map_element "fn-group", to: :fn_group
      end
    end
  end
end

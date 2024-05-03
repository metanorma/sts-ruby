# frozen_string_literal: true

require_relative "../mapper"

require_relative "reference_list"
require_relative "section"
require_relative "app_group"
require_relative "fn_group"

module Sts
  module NisoSts
    class Back < Sts::Mapper
      attribute :ref_list, ReferenceList
      attribute :app_group, AppGroup
      attribute :sec, Section
      attribute :fn_group, FnGroup

      xml do
        root "back"

        map_element "ref-list", to: :ref_list
        map_element "app-group", to: :app_group
        map_element "sec", to: :sec
        map_element "fn-group", to: :fn_group
      end
    end
  end
end

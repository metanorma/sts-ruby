# frozen_string_literal: true

module Sts
  module IsoSts
    class Back < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :app_group, ::Sts::IsoSts::AppGroup, collection: true
      attribute :ref_list, ::Sts::IsoSts::RefList, collection: true
      attribute :fn_group, ::Sts::IsoSts::FnGroup, collection: true
      attribute :sec, ::Sts::IsoSts::Sec, collection: true

      xml do
        element "back"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type

        map_element "app-group", to: :app_group
        map_element "ref-list", to: :ref_list
        map_element "fn-group", to: :fn_group
        map_element "sec", to: :sec
      end
    end
  end
end

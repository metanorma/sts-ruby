# frozen_striing_literal: true

module Sts
  module NisoSts
    class ExtLink < Lutaml::Model::Serializable
      attribute :ext_link_type, :string
      attribute :href, :xlink_href
      attribute :content, :string

      xml do
        element "ext-link"

        map_content to: :content

        map_attribute "ext-link-type", to: :ext_link_type
        map_attribute "href", to: :href
      end
    end
  end
end

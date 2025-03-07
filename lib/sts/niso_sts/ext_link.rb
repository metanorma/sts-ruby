# frozen_striing_literal: true

require "lutaml/model"

module Sts
  module NisoSts
    class ExtLink < Lutaml::Model::Serializable
      attribute :ext_link_type, :string
      attribute :href, :string
      attribute :content, :string

      xml do
        root "ext-link"

        map_content to: :content

        map_attribute "ext-link-type", to: :ext_link_type
        map_attribute "href", to: :href,
                              namespace: "http://www.w3.org/1999/xlink",
                              prefix: "xlink"
      end
    end
  end
end

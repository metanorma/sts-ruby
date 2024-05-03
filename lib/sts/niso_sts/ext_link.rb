# frozen_striing_literal: true

require_relative "../mapper"

module Sts
  module NisoSts
    class ExtLink < Sts::Mapper
      attribute :ext_link_type, Shale::Type::String
      attribute :content, Shale::Type::String

      xml do
        root "ext-link"

        map_content to: :content

        map_attribute "ext-link-type", to: :ext_link_type
      end
    end
  end
end

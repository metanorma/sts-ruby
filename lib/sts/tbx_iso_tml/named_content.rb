# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module TbxIsoTml
    class NamedContent < Sts::Mapper
      attribute :content_type, Shale::Type::String
      attribute :content, Shale::Type::String

      xml do
        root "named-content"

        map_attribute "content-type", to: :content_type

        map_content to: :content
      end
    end
  end
end

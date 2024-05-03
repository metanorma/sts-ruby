# frozen_string_literal: true

require "shale"

module Sts
  module TbxIsoTml
    class NamedContent < Shale::Mapper
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

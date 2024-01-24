# frozen_string_literal: true

require "shale"

require_relative "italic"
require_relative "../mapper"

module Sts
  module TbxIsoTml
    class Source < Sts::Mapper
      attribute :value, Shale::Type::String
      attribute :italic, Italic

      xml do
        root "source"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_content to: :value
        map_element "italic", to: :italic, namespace: nil, prefix: nil
      end
    end
  end
end

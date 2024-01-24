# frozen_string_literal: true

require "shale"

require_relative "../mapper"
require_relative "entailed_term"

module Sts
  module TbxIsoTml
    class Example < Sts::Mapper
      attribute :value, Shale::Type::String
      attribute :entailed_term, EntailedTerm

      xml do
        root "example"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_content to: :value
        map_element "entailedTerm", to: :entailed_term
      end
    end
  end
end

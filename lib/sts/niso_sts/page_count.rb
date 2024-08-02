# frozen_string_literal: true

require_relative "../mapper"

module Sts
  module NisoSts
    class PageCount < Sts::Mapper
      attribute :count, Lutaml::Model::Type::Integer

      xml do
        root "page-count"
        map_attribute "count", to: :count
      end
    end
  end
end

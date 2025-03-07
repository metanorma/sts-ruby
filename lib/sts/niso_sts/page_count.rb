# frozen_string_literal: true

require "lutaml/model"

module Sts
  module NisoSts
    class PageCount < Lutaml::Model::Serializable
      attribute :count, :integer

      xml do
        root "page-count"
        map_attribute "count", to: :count
      end
    end
  end
end

# frozen_string_literal: true

require "lutaml/model"

module Sts
  module NisoSts
    class MetaDate < Lutaml::Model::Serializable
      attribute :content, Lutaml::Model::Type::String
      attribute :type, Lutaml::Model::Type::String

      xml do
        root "meta-date"

        map_content to: :content

        map_attribute :type, to: :type
      end
    end
  end
end

# frozen_string_literal: true

require_relative "italic"
require "lutaml/model"

module Sts
  module TbxIsoTml
    class Source < Lutaml::Model::Serializable
      attribute :value, Lutaml::Model::Type::String
      attribute :italic, Italic

      xml do
        root "source", mixed: true
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_content to: :value
        map_element "italic", to: :italic, namespace: nil, prefix: nil
      end
    end
  end
end

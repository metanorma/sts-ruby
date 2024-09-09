# frozen_string_literal: true

require "lutaml/model"
require_relative "xref"

module Sts
  module TbxIsoTml
    class Xref < Lutaml::Model::Serializable; end

    class Sup < Lutaml::Model::Serializable
      attribute :value, Lutaml::Model::Type::String
      attribute :xref, Xref

      xml do
        root "sup"

        map_element "xref", to: :xref, namespace: nil, prefix: nil
        map_content to: :value
      end
    end
  end
end

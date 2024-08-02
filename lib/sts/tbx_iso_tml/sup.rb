# frozen_string_literal: true

require_relative "../mapper"
require_relative "xref"

module Sts
  module TbxIsoTml
    class Xref < Sts::Mapper; end

    class Sup < Sts::Mapper
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

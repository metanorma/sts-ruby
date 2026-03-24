# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class Sup < Lutaml::Model::Serializable
      attribute :value, :string
      attribute :xref, ::Sts::TbxIsoTml::Xref

      xml do
        element "sup"

        map_element "xref", to: :xref
        map_content to: :value
      end
    end
  end
end

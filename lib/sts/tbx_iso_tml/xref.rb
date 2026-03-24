# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class Xref < Lutaml::Model::Serializable
      attribute :ref_type, :string
      attribute :rid, :string
      attribute :value, :string
      attribute :sup, ::Sts::TbxIsoTml::Sup

      xml do
        element "xref"

        map_attribute "ref-type", to: :ref_type
        map_attribute "rid", to: :rid
        map_element "sup", to: :sup
        map_content to: :value
      end
    end
  end
end

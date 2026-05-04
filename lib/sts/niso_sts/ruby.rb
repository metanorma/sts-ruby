# frozen_string_literal: true

module Sts
  module NisoSts
    class Ruby < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :specific_use, :string
      attribute :rb, ::Sts::NisoSts::Rb
      attribute :rt, ::Sts::NisoSts::Rt

      xml do
        element "ruby"
        ordered

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "specific-use", to: :specific_use
        map_element "rb", to: :rb
        map_element "rt", to: :rt
      end
    end
  end
end

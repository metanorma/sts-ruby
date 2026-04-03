# frozen_string_literal: true

module Sts
  module NisoSts
    class SigBlock < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :sig, ::Sts::NisoSts::Sig, collection: true

      xml do
        element "sig-block"

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use

        map_element "sig", to: :sig
      end
    end
  end
end

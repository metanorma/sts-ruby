# frozen_string_literal: true

module Sts
  module NisoSts
    class CompoundKwd < Lutaml::Model::Serializable
      attribute :content_type, :string
      attribute :id, :string
      attribute :kwd_type, :string
      attribute :specific_use, :string
      attribute :compound_kwd_part, ::Sts::NisoSts::CompoundKwdPart,
                collection: true

      xml do
        element "compound-kwd"

        map_attribute "content-type", to: :content_type
        map_attribute "id", to: :id
        map_attribute "kwd-type", to: :kwd_type
        map_attribute "specific-use", to: :specific_use

        map_element "compound-kwd-part", to: :compound_kwd_part
      end
    end
  end
end

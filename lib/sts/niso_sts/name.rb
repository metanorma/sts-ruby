# frozen_string_literal: true

module Sts
  module NisoSts
    class Name < Lutaml::Model::Serializable
      attribute :name_style, :string
      attribute :content_type, :string
      attribute :surname, ::Sts::NisoSts::Surname
      attribute :given_names, ::Sts::NisoSts::GivenNames
      attribute :prefix, ::Sts::NisoSts::Prefix
      attribute :suffix, ::Sts::NisoSts::Suffix

      xml do
        element "name"
        ordered

        map_attribute "name-style", to: :name_style
        map_attribute "content-type", to: :content_type
        map_element "surname", to: :surname
        map_element "given-names", to: :given_names
        map_element "prefix", to: :prefix
        map_element "suffix", to: :suffix
      end
    end
  end
end

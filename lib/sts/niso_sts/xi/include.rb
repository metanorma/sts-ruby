# frozen_string_literal: true

module Sts
  module NisoSts
    module Xi
      class Include < Lutaml::Model::Serializable
        attribute :href, :string
        attribute :parse, :string
        attribute :xpointer, :string
        attribute :accept, :string
        attribute :accept_language, :string
        attribute :encoding_method, :string

        xml do
          element "xi:include"

          map_attribute "href", to: :href
          map_attribute "parse", to: :parse
          map_attribute "xpointer", to: :xpointer
          map_attribute "accept", to: :accept
          map_attribute "accept-language", to: :accept_language
          map_attribute "encoding", to: :encoding_method
        end
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module NisoSts
    class Body < Lutaml::Model::Serializable
      attribute :sec, ::Sts::NisoSts::Section, collection: true

      xml do
        element "body"
        map_element "sec", to: :sec
      end
    end
  end
end

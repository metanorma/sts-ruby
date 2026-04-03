# frozen_string_literal: true

module Sts
  module NisoSts
    class IcsWrap < Lutaml::Model::Serializable
      attribute :ics, ::Sts::NisoSts::Ics, collection: true

      xml do
        element "ics-wrap"

        map_element "ics", to: :ics
      end
    end
  end
end

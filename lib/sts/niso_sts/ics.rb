# frozen_string_literal: true

module Sts
  module NisoSts
    class Ics < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :ics_desc, ::Sts::NisoSts::IcsDesc

      xml do
        element "ics"

        map_content to: :content
        map_element "ics-desc", to: :ics_desc
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <ics> as type="xs:string" -- no attributes.
    class Ics < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "ics"

        map_content to: :content
      end
    end
  end
end

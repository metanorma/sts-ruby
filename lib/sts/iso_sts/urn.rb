# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <urn> as type="xs:string" -- no attributes.
    class Urn < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "urn"

        map_content to: :content
      end
    end
  end
end

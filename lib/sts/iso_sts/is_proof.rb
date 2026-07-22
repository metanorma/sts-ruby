# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <is-proof> as an empty complexType: its presence carries
    # no content. The @id follows the NisoSts convention established in 86948b9,
    # not ISOSTS itself.
    class IsProof < Lutaml::Model::Serializable
      attribute :id, :string

      xml do
        element "is-proof"

        map_attribute "id", to: :id
      end
    end
  end
end

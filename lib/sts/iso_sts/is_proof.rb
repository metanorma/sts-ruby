# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <is-proof> as an empty complexType: its presence is the
    # whole signal -- no attributes, no content.
    class IsProof < Lutaml::Model::Serializable
      xml do
        element "is-proof"
      end
    end
  end
end

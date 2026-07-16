# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <wi-number> as mixed content carrying an @id. Modelling it
    # as a plain string silently discarded that @id.
    class WiNumber < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :id, :string

      xml do
        element "wi-number"

        map_content to: :content
        map_attribute "id", to: :id
      end
    end
  end
end

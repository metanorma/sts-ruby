# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <sdo> as type="xs:string" -- no attributes.
    class Sdo < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "sdo"

        map_content to: :content
      end
    end
  end
end

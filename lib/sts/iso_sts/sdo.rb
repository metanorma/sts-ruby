# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <sdo> as type="xs:string". The @id follows the
    # NisoSts convention established in 86948b9, not ISOSTS itself.
    class Sdo < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :id, :string

      xml do
        element "sdo"

        map_content to: :content
        map_attribute "id", to: :id
      end
    end
  end
end

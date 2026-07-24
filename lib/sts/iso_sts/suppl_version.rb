# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <suppl-version> as type="xs:string". The @id follows the
    # NisoSts convention established in 86948b9, not ISOSTS itself.
    class SupplVersion < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :id, :string

      xml do
        element "suppl-version"

        map_content to: :content
        map_attribute "id", to: :id
      end
    end
  end
end

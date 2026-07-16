# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <suppl-type> as type="xs:string" -- no attributes.
    class SupplType < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "suppl-type"

        map_content to: :content
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <suppl-version> as type="xs:string" -- no attributes.
    class SupplVersion < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "suppl-version"

        map_content to: :content
      end
    end
  end
end

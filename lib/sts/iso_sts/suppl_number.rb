# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <suppl-number> as type="xs:string" -- no attributes.
    class SupplNumber < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "suppl-number"

        map_content to: :content
      end
    end
  end
end

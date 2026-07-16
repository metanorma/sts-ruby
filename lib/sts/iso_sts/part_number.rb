# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <part-number> as type="xs:string" -- no attributes.
    class PartNumber < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "part-number"

        map_content to: :content
      end
    end
  end
end

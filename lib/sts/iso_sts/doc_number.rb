# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <doc-number> as type="xs:string" -- no attributes.
    class DocNumber < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "doc-number"

        map_content to: :content
      end
    end
  end
end

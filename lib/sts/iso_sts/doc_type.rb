# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <doc-type> as type="xs:string" -- no attributes.
    class DocType < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "doc-type"

        map_content to: :content
      end
    end
  end
end

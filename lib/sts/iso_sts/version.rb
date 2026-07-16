# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <version> as type="xs:string" -- no attributes.
    class Version < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "version"

        map_content to: :content
      end
    end
  end
end

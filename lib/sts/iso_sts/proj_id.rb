# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <proj-id> as type="xs:string" -- no attributes.
    class ProjId < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "proj-id"

        map_content to: :content
      end
    end
  end
end

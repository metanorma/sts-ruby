# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <proj-id> as type="xs:string". The @id follows the
    # NisoSts convention established in 86948b9, not ISOSTS itself.
    class ProjId < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :id, :string

      xml do
        element "proj-id"

        map_content to: :content
        map_attribute "id", to: :id
      end
    end
  end
end

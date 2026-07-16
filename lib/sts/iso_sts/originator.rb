# frozen_string_literal: true

module Sts
  module IsoSts
    # ISOSTS declares <originator> as type="xs:string" -- no attributes.
    class Originator < Lutaml::Model::Serializable
      attribute :content, :string

      xml do
        element "originator"

        map_content to: :content
      end
    end
  end
end

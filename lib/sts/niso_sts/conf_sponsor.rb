# frozen_string_literal: true

module Sts
  module NisoSts
    class ConfSponsor < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      xml do
        element "conf-sponsor"
        mixed_content

        map_content to: :content
      end
    end
  end
end

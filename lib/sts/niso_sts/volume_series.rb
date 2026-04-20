# frozen_string_literal: true

module Sts
  module NisoSts
    class VolumeSeries < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      xml do
        element "volume-series"
        mixed_content

        map_content to: :content
      end
    end
  end
end

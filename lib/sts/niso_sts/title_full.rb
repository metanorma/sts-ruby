# frozen_string_literal: true

module Sts
  module NisoSts
    class TitleFull < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      attribute :std, ::Sts::NisoSts::ReferenceStandard

      xml do
        element "full"
        mixed_content

        map_content to: :content
        map_element "std", to: :std
      end
    end
  end
end

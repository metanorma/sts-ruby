# frozen_striing_literal: true


module Sts
  module NisoSts
    class MixedCitation < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :bold, :string
      attribute :italic, :string
      attribute :publication_type, :string
      attribute :std, ::Sts::NisoSts::ReferenceStandard, collection: true
      attribute :ext_link, ::Sts::NisoSts::ExtLink

      xml do
        element "mixed-citation"
        mixed_content

        map_content to: :content

        map_attribute "publication-type", to: :publication_type

        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "std", to: :std
        map_element "ext-link", to: :ext_link
      end
    end
  end
end

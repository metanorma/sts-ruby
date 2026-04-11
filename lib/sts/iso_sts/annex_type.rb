# frozen_string_literal: true

module Sts
  module IsoSts
    class AnnexType < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :bold, ::Sts::IsoSts::Bold
      attribute :italic, ::Sts::IsoSts::Italic

      xml do
        element "annex-type"
        mixed_content

        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
      end
    end
  end
end

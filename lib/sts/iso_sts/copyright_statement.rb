# frozen_string_literal: true

module Sts
  module IsoSts
    class CopyrightStatement < Lutaml::Model::Serializable
      attribute :content, :string
      attribute :bold, ::Sts::IsoSts::Bold
      attribute :italic, ::Sts::IsoSts::Italic
      attribute :ext_link, ::Sts::NisoSts::ExtLink
      attribute :uri, ::Sts::NisoSts::Uri

      xml do
        element "copyright-statement"
        mixed_content

        map_content to: :content
        map_element "bold", to: :bold
        map_element "italic", to: :italic
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module IsoSts
    class FigGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :position, :string
      attribute :orientation, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content_type, :string
      attribute :originator, :string
      attribute :label, ::Sts::IsoSts::Label
      attribute :caption, ::Sts::IsoSts::Caption
      attribute :alt_text, ::Sts::IsoSts::AltText, collection: true
      attribute :long_desc, ::Sts::IsoSts::LongDesc, collection: true
      attribute :email, ::Sts::IsoSts::Email, collection: true
      attribute :ext_link, ::Sts::IsoSts::ExtLink, collection: true
      attribute :uri, ::Sts::IsoSts::Uri, collection: true
      attribute :fig, ::Sts::IsoSts::Fig, collection: true
      attribute :alternatives, ::Sts::IsoSts::Alternatives, collection: true
      attribute :graphic, ::Sts::IsoSts::Graphic, collection: true
      attribute :media, ::Sts::IsoSts::Media, collection: true

      xml do
        element "fig-group"
        ordered

        map_attribute "id", to: :id
        map_attribute "position", to: :position
        map_attribute "orientation", to: :orientation
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "content-type", to: :content_type
        map_attribute "originator", to: :originator
        map_element "label", to: :label
        map_element "caption", to: :caption
        map_element "alt-text", to: :alt_text
        map_element "long-desc", to: :long_desc
        map_element "email", to: :email
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
        map_element "fig", to: :fig
        map_element "alternatives", to: :alternatives
        map_element "graphic", to: :graphic
        map_element "media", to: :media
      end
    end
  end
end

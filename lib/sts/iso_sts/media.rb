# frozen_string_literal: true

module Sts
  module IsoSts
    class Media < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :position, :string
      attribute :orientation, :string
      attribute :specific_use, :string
      attribute :xml_lang, :string
      attribute :content_type, :string
      attribute :mimetype, :string
      attribute :mime_subtype, :string
      attribute :xlink_type, :string
      attribute :xlink_href, :string
      attribute :xlink_role, :string
      attribute :xlink_title, :string
      attribute :xlink_show, :string
      attribute :xlink_actuate, :string
      attribute :originator, :string
      attribute :alt_text, ::Sts::IsoSts::AltText, collection: true
      attribute :long_desc, ::Sts::IsoSts::LongDesc, collection: true
      attribute :email, ::Sts::IsoSts::Email, collection: true
      attribute :ext_link, ::Sts::IsoSts::ExtLink, collection: true
      attribute :uri, ::Sts::IsoSts::Uri, collection: true
      attribute :sts_object_id, ::Sts::IsoSts::ObjectId, collection: true
      attribute :label, ::Sts::IsoSts::Label, collection: true
      attribute :caption, ::Sts::IsoSts::Caption, collection: true
      attribute :attrib, ::Sts::IsoSts::Attrib, collection: true
      attribute :permissions, ::Sts::IsoSts::Permissions, collection: true

      xml do
        element "media"
        ordered

        map_attribute "id", to: :id
        map_attribute "position", to: :position
        map_attribute "orientation", to: :orientation
        map_attribute "specific-use", to: :specific_use
        map_attribute "xml:lang", to: :xml_lang
        map_attribute "content-type", to: :content_type
        map_attribute "mimetype", to: :mimetype
        map_attribute "mime-subtype", to: :mime_subtype
        map_attribute "xlink:type", to: :xlink_type
        map_attribute "xlink:href", to: :xlink_href
        map_attribute "xlink:role", to: :xlink_role
        map_attribute "xlink:title", to: :xlink_title
        map_attribute "xlink:show", to: :xlink_show
        map_attribute "xlink:actuate", to: :xlink_actuate
        map_attribute "originator", to: :originator
        map_element "alt-text", to: :alt_text
        map_element "long-desc", to: :long_desc
        map_element "email", to: :email
        map_element "ext-link", to: :ext_link
        map_element "uri", to: :uri
        map_element "object-id", to: :sts_object_id
        map_element "label", to: :label
        map_element "caption", to: :caption
        map_element "attrib", to: :attrib
        map_element "permissions", to: :permissions
      end
    end
  end
end

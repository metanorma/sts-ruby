# frozen_string_literal: true

module Sts
  module NisoSts
    class Media < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :mimetype, :string
      attribute :mime_subtype, :string
      attribute :orientation, :string
      attribute :position, :string
      attribute :specific_use, :string
      attribute :xlink_href, :string
      attribute :xlink_role, :string
      attribute :xlink_actuate, :string
      attribute :xlink_show, :string
      attribute :xlink_title, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :caption, ::Sts::NisoSts::Caption
      attribute :sts_object_id, ::Sts::NisoSts::ObjectId, collection: true

      xml do
        element "media"

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "mimetype", to: :mimetype
        map_attribute "mime-subtype", to: :mime_subtype
        map_attribute "orientation", to: :orientation
        map_attribute "position", to: :position
        map_attribute "specific-use", to: :specific_use
        map_attribute "xlink:href", to: :xlink_href
        map_attribute "xlink:role", to: :xlink_role
        map_attribute "xlink:actuate", to: :xlink_actuate
        map_attribute "xlink:show", to: :xlink_show
        map_attribute "xlink:title", to: :xlink_title

        map_element "label", to: :label
        map_element "caption", to: :caption
        map_element "object-id", to: :sts_object_id
      end
    end
  end
end

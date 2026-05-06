# frozen_string_literal: true

# rubocop:disable Layout/LineLength
# <graphic xlink:href="e1d18be9.001.gif">
#   <object-id pub-id-type="fpi">+//ISO 9070/RA::A00007::GE::DIN German Institute for
#       Standardization::Standards//NONSGML ISO 13849-1:2006-11-00::Figure 1//EN</object-id>
#   <object-id pub-id-type="publisher-id">fig-1</object-id>
# </graphic>
# rubocop:enable Layout/LineLength

module Sts
  module NisoSts
    class Graphic < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :href, :xlink_href
      attribute :xlink_type, :string
      attribute :sts_object_id, ::Sts::NisoSts::ObjectId, collection: true

      xml do
        element "graphic"

        map_attribute "id", to: :id
        map_attribute "href", to: :href
        map_attribute "xlink:type", to: :xlink_type
        map_element "object-id", to: :sts_object_id
      end
    end
  end
end

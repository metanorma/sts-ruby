require "lutaml/model"

require_relative "object_id"

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
      attribute :href, :string
      attribute :object_id, ObjectId, collection: true

      xml do
        root "graphic"

        map_attribute "href", to: :href,
                              namespace: "http://www.w3.org/1999/xlink",
                              prefix: "xlink"
        map_element "object-id", to: :object_id
      end
    end
  end
end

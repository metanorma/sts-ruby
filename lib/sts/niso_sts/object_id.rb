# frozen_string_literal: true

# rubocop:disable Layout/LineLength
# <object-id pub-id-type="fpi">+//ISO 9070/RA::A00007::GE::DIN German Institute for
#       Standardization::Standards//NONSGML ISO 13849-1:2006-11-00::Figure 1//EN</object-id>
# <object-id pub-id-type="publisher-id">fig-1</object-id>
# rubocop:enable Layout/LineLength

module Sts
  module NisoSts
    class ObjectId < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :pub_id_type, :string
      attribute :content, :string

      xml do
        element "object-id"

        map_attribute "id", to: :id
        map_attribute "pub-id-type", to: :pub_id_type
        map_content to: :content
      end
    end
  end
end

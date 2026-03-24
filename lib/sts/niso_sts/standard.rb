# frozen_string_literal: true


module Sts
  module NisoSts
    class Standard < Lutaml::Model::Serializable
      attribute :front, ::Sts::NisoSts::Front
      attribute :body, ::Sts::NisoSts::Body
      attribute :back, ::Sts::NisoSts::Back
      attribute :id, :string
      attribute :lang, Lutaml::Xml::W3c::XmlLangType
      attribute :mml, :string
      attribute :tbx, :string
      attribute :xlink, :string

      xml do
        element "standard"
        namespace_scope [
          ::Sts::Namespaces::MathmlNamespace,
          ::Sts::Namespaces::TbxNamespace,
          ::Lutaml::Xml::W3c::XlinkNamespace
        ]

        map_attribute "id", to: :id
        map_attribute "lang", to: :lang
        map_element "front", to: :front
        map_element "body", to: :body
        map_element "back", to: :back
      end
    end
  end
end

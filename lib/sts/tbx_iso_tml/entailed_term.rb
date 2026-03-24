# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class EntailedTerm < Lutaml::Model::Serializable
      attribute :target, :string
      attribute :xtarget, :string
      attribute :lang, Lutaml::Xml::W3c::XmlLangType
      attribute :value, :string

      xml do
        element "entailedTerm"
        namespace ::Sts::Namespaces::TbxNamespace

        map_attribute "target", to: :target
        map_attribute "xtarget", to: :xtarget
        map_attribute "lang", to: :lang
        map_content to: :value
      end
    end
  end
end

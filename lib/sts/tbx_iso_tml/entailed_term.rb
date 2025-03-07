# frozen_string_literal: true

require "lutaml/model"

module Sts
  module TbxIsoTml
    class EntailedTerm < Lutaml::Model::Serializable
      attribute :target, :string
      attribute :xtarget, :string
      attribute :lang, :string
      attribute :value, :string

      xml do
        root "entailedTerm"
        namespace "urn:iso:std:iso:30042:ed-1", "tbx"

        map_attribute :target, to: :target
        map_attribute :xtarget, to: :xtarget
        map_attribute :lang, to: :lang,
                             namespace: "http://www.w3.org/XML/1998/namespace",
                             prefix: "xml"
        map_content to: :value
      end
    end
  end
end

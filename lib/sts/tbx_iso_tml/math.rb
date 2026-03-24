# frozen_string_literal: true


module Sts
  module TbxIsoTml

    class Math < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content, :string
      attribute :display, :string
      attribute :mrow, ::Sts::TbxIsoTml::Mrow
      attribute :msub, ::Sts::TbxIsoTml::Msub, collection: true
      attribute :msup, ::Sts::TbxIsoTml::Msup
      attribute :mn, :string, collection: true
      attribute :mo, :string, collection: true
      attribute :mi, :string
      attribute :mtext, :string
      attribute :semantics, ::Sts::TbxIsoTml::Semantics
      attribute :mstyle, ::Sts::TbxIsoTml::Mstyle, collection: true
      attribute :mfenced, ::Sts::TbxIsoTml::Mfenced, collection: true
      attribute :mspace, ::Sts::TbxIsoTml::Mspace, collection: true
      attribute :mfrac, ::Sts::TbxIsoTml::Mfrac, collection: true
      attribute :munderover, ::Sts::TbxIsoTml::Munderover, collection: true

      xml do
        element "math"
        mixed_content
        namespace ::Sts::Namespaces::MathmlNamespace

        map_attribute "id", to: :id

        map_element "mrow", to: :mrow # , render_nil: true
        map_element "msub", to: :msub # , render_nil: true
        map_element "msup", to: :msup # , render_nil: true
        map_element "semantics", to: :semantics
        map_element "mn", to: :mn
        map_element "mi", to: :mi
        map_element "mtext", to: :mtext
        map_element "mo", to: :mo # , render_nil: true
        map_element "mstyle", to: :mstyle
        map_element "mspace", to: :mspace
        map_element "mfrac", to: :mfrac
        map_element "mfenced", to: :mfenced
        map_element "munderover", to: :munderover

        map_content to: :content
        map_attribute "display", to: :display
      end
    end
  end
end

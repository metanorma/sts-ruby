# frozen_string_literal: true

module Sts
  module NisoSts
    class NestedKwd < Lutaml::Model::Serializable
      attribute :kwd, ::Sts::NisoSts::Kwd
      attribute :kwd_group, ::Sts::NisoSts::KwdGroup, collection: true
      attribute :nested_kwd, ::Sts::NisoSts::NestedKwd, collection: true

      xml do
        element "nested-kwd"
        ordered

        map_element "kwd", to: :kwd
        map_element "kwd-group", to: :kwd_group
        map_element "nested-kwd", to: :nested_kwd
      end
    end
  end
end

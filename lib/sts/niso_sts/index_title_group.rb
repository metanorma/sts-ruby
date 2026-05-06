# frozen_string_literal: true

module Sts
  module NisoSts
    class IndexTitleGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :title, ::Sts::NisoSts::Title
      attribute :subtitle, ::Sts::NisoSts::Subtitle, collection: true

      xml do
        element "index-title-group"
        ordered

        map_attribute "id", to: :id
        map_element "label", to: :label
        map_element "title", to: :title
        map_element "subtitle", to: :subtitle
      end
    end
  end
end

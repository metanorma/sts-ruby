# frozen_string_literal: true

module Sts
  module NisoSts
    class TransTitleGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :trans_title, ::Sts::NisoSts::TransTitle, collection: true

      xml do
        element "trans-title-group"

        map_attribute "id", to: :id

        map_element "trans-title", to: :trans_title
      end
    end
  end
end

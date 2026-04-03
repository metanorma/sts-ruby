# frozen_string_literal: true

module Sts
  module NisoSts
    class TransTitleGroup < Lutaml::Model::Serializable
      attribute :trans_title, ::Sts::NisoSts::TransTitle, collection: true

      xml do
        element "trans-title-group"

        map_element "trans-title", to: :trans_title
      end
    end
  end
end

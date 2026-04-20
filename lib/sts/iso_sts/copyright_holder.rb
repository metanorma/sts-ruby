# frozen_string_literal: true

module Sts
  module IsoSts
    class CopyrightHolder < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      attribute :sub, ::Sts::NisoSts::Sub
      attribute :sup, ::Sts::NisoSts::Sup

      xml do
        element "copyright-holder"
        mixed_content

        map_content to: :content
        map_element "sub", to: :sub
        map_element "sup", to: :sup
      end
    end
  end
end

# frozen_string_literal: true

module Sts
  module NisoSts
    class Sig < Lutaml::Model::Serializable
      attribute :graphic, ::Sts::NisoSts::Graphic
      attribute :content, :string

      xml do
        element "sig"
        mixed_content

        map_element "graphic", to: :graphic
        map_content to: :content
      end
    end
  end
end

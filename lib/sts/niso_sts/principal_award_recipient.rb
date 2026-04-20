# frozen_string_literal: true

module Sts
  module NisoSts
    class PrincipalAwardRecipient < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      xml do
        element "principal-award-recipient"
        mixed_content

        map_content to: :content
      end
    end
  end
end

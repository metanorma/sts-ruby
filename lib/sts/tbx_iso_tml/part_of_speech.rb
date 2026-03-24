# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class PartOfSpeech < Lutaml::Model::Serializable
      attribute :value, :string,
                values: %w[noun verb adj adv]

      xml do
        element "partOfSpeech"
        namespace ::Sts::Namespaces::TbxNamespace

        map_attribute "value", to: :value
      end
    end
  end
end

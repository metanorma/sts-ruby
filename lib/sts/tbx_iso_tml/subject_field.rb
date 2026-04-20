# frozen_string_literal: true

module Sts
  module TbxIsoTml
    class SubjectField < Lutaml::Model::Serializable
      attribute :value, :string, collection: true
      xml do
        element "subjectField"
        mixed_content
        namespace ::Sts::Namespaces::TbxNamespace

        map_content to: :value
      end
    end
  end
end

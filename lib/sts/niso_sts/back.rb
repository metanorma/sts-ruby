# frozen_string_literal: true

module Sts
  module NisoSts
    class Back < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :label, ::Sts::NisoSts::Label
      attribute :title, ::Sts::NisoSts::Title
      attribute :ack, ::Sts::NisoSts::Ack, collection: true
      attribute :app_group, ::Sts::NisoSts::AppGroup, collection: true
      attribute :bio, ::Sts::NisoSts::Bio, collection: true
      attribute :fn_group, ::Sts::NisoSts::FnGroup, collection: true
      attribute :glossary, ::Sts::NisoSts::Glossary, collection: true
      attribute :index, ::Sts::NisoSts::Index, collection: true
      attribute :notes, ::Sts::NisoSts::Notes, collection: true
      attribute :ref_list, ::Sts::NisoSts::ReferenceList, collection: true
      attribute :sec, ::Sts::NisoSts::Section, collection: true
      attribute :toc, ::Sts::NisoSts::Toc, collection: true

      xml do
        element "back"
        ordered

        map_attribute "id", to: :id
        map_element "label", to: :label
        map_element "title", to: :title
        map_element "ack", to: :ack
        map_element "app-group", to: :app_group
        map_element "bio", to: :bio
        map_element "fn-group", to: :fn_group
        map_element "glossary", to: :glossary
        map_element "index", to: :index
        map_element "notes", to: :notes
        map_element "ref-list", to: :ref_list
        map_element "sec", to: :sec
        map_element "toc", to: :toc
      end
    end
  end
end

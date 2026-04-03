# frozen_string_literal: true

module Sts
  module NisoSts
    class Contrib < Lutaml::Model::Serializable
      attribute :contrib_type, :string
      attribute :corresp, :string
      attribute :deceased, :string
      attribute :equal_contrib, :string
      attribute :id, :string
      attribute :contrib_id, ::Sts::NisoSts::ContribId, collection: true
      attribute :name, ::Sts::NisoSts::Name
      attribute :collab, ::Sts::NisoSts::Collab, collection: true
      attribute :name_alternatives, ::Sts::NisoSts::NameAlternatives
      attribute :collab_alternatives, ::Sts::NisoSts::CollabAlternatives
      attribute :aff, ::Sts::NisoSts::Aff, collection: true
      attribute :aff_alternatives, ::Sts::NisoSts::AffAlternatives
      attribute :role, ::Sts::NisoSts::Role
      attribute :degrees, ::Sts::NisoSts::Degrees
      attribute :on_behalf_of, ::Sts::NisoSts::OnBehalfOf
      attribute :address, ::Sts::NisoSts::Address
      attribute :bio, ::Sts::NisoSts::Bio
      attribute :email, ::Sts::NisoSts::Email, collection: true
      attribute :ext_link, ::Sts::NisoSts::ExtLink, collection: true
      attribute :fn, ::Sts::NisoSts::Fn, collection: true
      attribute :uri, ::Sts::NisoSts::Uri
      attribute :xref, ::Sts::TbxIsoTml::Xref, collection: true

      xml do
        element "contrib"

        map_attribute "contrib-type", to: :contrib_type
        map_attribute "corresp", to: :corresp
        map_attribute "deceased", to: :deceased
        map_attribute "equal-contrib", to: :equal_contrib
        map_attribute "id", to: :id

        map_element "contrib-id", to: :contrib_id
        map_element "name", to: :name
        map_element "collab", to: :collab
        map_element "name-alternatives", to: :name_alternatives
        map_element "collab-alternatives", to: :collab_alternatives
        map_element "aff", to: :aff
        map_element "aff-alternatives", to: :aff_alternatives
        map_element "role", to: :role
        map_element "degrees", to: :degrees
        map_element "on-behalf-of", to: :on_behalf_of
        map_element "address", to: :address
        map_element "bio", to: :bio
        map_element "email", to: :email
        map_element "ext-link", to: :ext_link
        map_element "fn", to: :fn
        map_element "uri", to: :uri
        map_element "xref", to: :xref
      end
    end
  end
end

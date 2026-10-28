# frozen_string_literal: true

module Sts
  module IsoSts
    class ContribGroup < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :content_type, :string
      attribute :specific_use, :string
      attribute :contrib, ::Sts::IsoSts::Contrib, collection: true
      attribute :address, ::Sts::IsoSts::Address, collection: true
      attribute :aff, ::Sts::IsoSts::Aff, collection: true
      attribute :aff_alternatives, ::Sts::IsoSts::AffAlternatives,
                collection: true
      attribute :author_comment, ::Sts::IsoSts::AuthorComment, collection: true
      attribute :bio, ::Sts::IsoSts::Bio, collection: true
      attribute :email, ::Sts::IsoSts::Email, collection: true
      attribute :ext_link, ::Sts::IsoSts::ExtLink, collection: true
      attribute :on_behalf_of, ::Sts::IsoSts::OnBehalfOf, collection: true
      attribute :role, ::Sts::IsoSts::Role, collection: true
      attribute :uri, ::Sts::IsoSts::Uri, collection: true
      attribute :xref, ::Sts::IsoSts::Xref, collection: true

      xml do
        element "contrib-group"
        ordered

        map_attribute "id", to: :id
        map_attribute "content-type", to: :content_type
        map_attribute "specific-use", to: :specific_use
        map_element "contrib", to: :contrib
        map_element "address", to: :address
        map_element "aff", to: :aff
        map_element "aff-alternatives", to: :aff_alternatives
        map_element "author-comment", to: :author_comment
        map_element "bio", to: :bio
        map_element "email", to: :email
        map_element "ext-link", to: :ext_link
        map_element "on-behalf-of", to: :on_behalf_of
        map_element "role", to: :role
        map_element "uri", to: :uri
        map_element "xref", to: :xref
      end
    end
  end
end

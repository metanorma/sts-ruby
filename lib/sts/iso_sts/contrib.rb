# frozen_string_literal: true

module Sts
  module IsoSts
    class Contrib < Lutaml::Model::Serializable
      attribute :id, :string
      attribute :contrib_type, :string
      attribute :corresp, :string
      attribute :equal_contrib, :string
      attribute :deceased, :string
      attribute :rid, :string
      attribute :specific_use, :string
      attribute :xlink_type, :string
      attribute :xlink_href, :string
      attribute :xlink_role, :string
      attribute :xlink_title, :string
      attribute :xlink_show, :string
      attribute :xlink_actuate, :string
      attribute :anonymous, ::Sts::IsoSts::Anonymous, collection: true
      attribute :collab, ::Sts::IsoSts::Collab, collection: true
      attribute :name, ::Sts::IsoSts::Name, collection: true
      attribute :name_alternatives, ::Sts::IsoSts::NameAlternatives,
                collection: true
      attribute :degrees, ::Sts::IsoSts::Degrees, collection: true
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

      xml do # rubocop:disable Metrics/BlockLength
        element "contrib"
        ordered

        map_attribute "id", to: :id
        map_attribute "contrib-type", to: :contrib_type
        map_attribute "corresp", to: :corresp
        map_attribute "equal-contrib", to: :equal_contrib
        map_attribute "deceased", to: :deceased
        map_attribute "rid", to: :rid
        map_attribute "specific-use", to: :specific_use
        map_attribute "xlink:type", to: :xlink_type
        map_attribute "xlink:href", to: :xlink_href
        map_attribute "xlink:role", to: :xlink_role
        map_attribute "xlink:title", to: :xlink_title
        map_attribute "xlink:show", to: :xlink_show
        map_attribute "xlink:actuate", to: :xlink_actuate
        map_element "anonymous", to: :anonymous
        map_element "collab", to: :collab
        map_element "name", to: :name
        map_element "name-alternatives", to: :name_alternatives
        map_element "degrees", to: :degrees
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

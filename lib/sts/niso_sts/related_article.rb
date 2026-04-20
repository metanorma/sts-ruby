# frozen_string_literal: true

module Sts
  module NisoSts
    class RelatedArticle < Lutaml::Model::Serializable
      attribute :content, :string, collection: true
      attribute :ext_link_type, :string
      attribute :href, :xlink_href
      attribute :id, :string
      attribute :related_article_type, :string

      xml do
        element "related-article"
        mixed_content

        map_content to: :content
        map_attribute "ext-link-type", to: :ext_link_type
        map_attribute "xlink:href", to: :href
        map_attribute "id", to: :id
        map_attribute "related-article-type", to: :related_article_type
      end
    end
  end
end

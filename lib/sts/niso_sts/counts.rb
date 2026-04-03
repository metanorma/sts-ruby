# frozen_string_literal: true

module Sts
  module NisoSts
    class Counts < Lutaml::Model::Serializable
      attribute :fig_count, ::Sts::NisoSts::FigCount
      attribute :table_count, ::Sts::NisoSts::TableCount
      attribute :equation_count, ::Sts::NisoSts::EquationCount
      attribute :ref_count, ::Sts::NisoSts::RefCount
      attribute :page_count, ::Sts::NisoSts::PageCount
      attribute :word_count, ::Sts::NisoSts::WordCount

      xml do
        element "counts"

        map_element "fig-count", to: :fig_count
        map_element "table-count", to: :table_count
        map_element "equation-count", to: :equation_count
        map_element "ref-count", to: :ref_count
        map_element "page-count", to: :page_count
        map_element "word-count", to: :word_count
      end
    end
  end
end

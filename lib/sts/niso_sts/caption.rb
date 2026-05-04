# rubocop:disable Layout/LineLength
# <caption>
#   <title>Overview of risk assessment/risk reduction</title>
#   <p><def-list list-type="footnotes">
#       <def-item>
#         <term>a</term>
#         <def>
#           <p>Refers to <std><std-id-group>
#                 <std-id std-id-link-type="internal-pub-id" std-id-type="dated">e1d167f5</std-id>
#                 <std-id std-id-link-type="fpi" std-id-type="dated">+//ISO 9070/RA::A00007::GE::DIN German
#                   Institute for Standardization::Standards//DOCUMENT ISO 12100-1:2003-11-00//EN</std-id>
#               </std-id-group>ISO 12100-1:2003</std>.</p>
#         </def>
#       </def-item>
#       <def-item>
#         <term>b</term>
#         <def>
#           <p>Refers to this part of ISO 13849.</p>
#         </def>
#       </def-item>
#     </def-list></p>
# </caption>
# rubocop:enable Layout/LineLength

module Sts
  module NisoSts
    class Caption < Lutaml::Model::Serializable
      attribute :title, ::Sts::NisoSts::Title
      attribute :paragraphs, ::Sts::NisoSts::Paragraph, collection: true
      attribute :non_normative_note, ::Sts::NisoSts::NonNormativeNote,
                collection: true
      attribute :label, ::Sts::NisoSts::Label
      attribute :list, ::Sts::NisoSts::List, collection: true
      attribute :def_list, ::Sts::NisoSts::DefList, collection: true

      xml do
        element "caption"
        ordered

        map_element "p", to: :paragraphs
        map_element "non-normative-note", to: :non_normative_note
        map_element "title", to: :title
        map_element "label", to: :label
        map_element "list", to: :list
        map_element "def-list", to: :def_list
      end
    end
  end
end

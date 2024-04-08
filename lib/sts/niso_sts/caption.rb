require "shale"

require_relative "paragraph"

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

module Sts
  module NisoSts
    class Caption < Shale::Mapper
      attribute :title, Shale::Type::String
      attribute :paragraphs, Paragraph, collection: true

      xml do
        root "caption"

        map_element "p", to: :paragraphs
        map_attribute "title", to: :title
      end
    end
  end
end

module Sts
  module Namespaces
    class MathmlNamespace < Lutaml::Xml::Namespace
      uri "http://www.w3.org/1998/Math/MathML"
      prefix_default "mml"
    end

    class TbxNamespace < Lutaml::Xml::Namespace
      uri "urn:iso:std:iso:30042:ed-1"
      uri_aliases "urn:iso:std:iso:30042:ed-2"
      prefix_default "tbx"
    end
  end
end

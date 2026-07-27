# frozen_string_literal: true

module Sts
  module Namespaces
    class TbxNamespace < Lutaml::Xml::Namespace
      uri "urn:iso:std:iso:30042:ed-1"
      uri_aliases "urn:iso:std:iso:30042:ed-2"
      prefix_default "tbx"
    end
  end
end

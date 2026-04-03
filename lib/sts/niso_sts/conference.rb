# frozen_string_literal: true

module Sts
  module NisoSts
    class Conference < Lutaml::Model::Serializable
      attribute :conf_date, ::Sts::NisoSts::ConfDate
      attribute :conf_name, ::Sts::NisoSts::ConfName
      attribute :conf_acronym, ::Sts::NisoSts::ConfAcronym
      attribute :conf_num, ::Sts::NisoSts::ConfNum
      attribute :conf_loc, ::Sts::NisoSts::ConfLoc
      attribute :conf_sponsor, ::Sts::NisoSts::ConfSponsor, collection: true
      attribute :conf_theme, ::Sts::NisoSts::ConfTheme
      attribute :string_conf, ::Sts::NisoSts::StringConf

      xml do
        element "conference"

        map_element "conf-date", to: :conf_date
        map_element "conf-name", to: :conf_name
        map_element "conf-acronym", to: :conf_acronym
        map_element "conf-num", to: :conf_num
        map_element "conf-loc", to: :conf_loc
        map_element "conf-sponsor", to: :conf_sponsor
        map_element "conf-theme", to: :conf_theme
        map_element "string-conf", to: :string_conf
      end
    end
  end
end

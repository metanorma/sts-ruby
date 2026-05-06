# frozen_string_literal: true

require "mml"

module Sts
  module IsoSts
    autoload :Standard, "#{__dir__}/iso_sts/standard"
    autoload :Front, "#{__dir__}/iso_sts/front"
    autoload :Body, "#{__dir__}/iso_sts/body"
    autoload :Back, "#{__dir__}/iso_sts/back"

    # Metadata
    autoload :IsoMeta, "#{__dir__}/iso_sts/iso_meta"
    autoload :RegMeta, "#{__dir__}/iso_sts/reg_meta"
    autoload :NatMeta, "#{__dir__}/iso_sts/nat_meta"
    autoload :TitleWrap, "#{__dir__}/iso_sts/title_wrap"
    autoload :TitleIntro, "#{__dir__}/iso_sts/title_intro"
    autoload :TitleMain, "#{__dir__}/iso_sts/title_main"
    autoload :TitleCompl, "#{__dir__}/iso_sts/title_compl"
    autoload :TitleFull, "#{__dir__}/iso_sts/title_full"
    autoload :DocumentIdentification,
             "#{__dir__}/iso_sts/document_identification"
    autoload :StandardIdentification,
             "#{__dir__}/iso_sts/standard_identification"
    autoload :Permissions, "#{__dir__}/iso_sts/permissions"
    autoload :CopyrightStatement, "#{__dir__}/iso_sts/copyright_statement"
    autoload :CopyrightYear, "#{__dir__}/iso_sts/copyright_year"
    autoload :CopyrightHolder, "#{__dir__}/iso_sts/copyright_holder"
    autoload :PageCount, "#{__dir__}/iso_sts/page_count"
    autoload :StandardCrossReference,
             "#{__dir__}/iso_sts/standard_cross_reference"
    autoload :Edition, "#{__dir__}/iso_sts/edition"
    autoload :Language, "#{__dir__}/iso_sts/language"
    autoload :DocRef, "#{__dir__}/iso_sts/doc_ref"
    autoload :ReleaseDate, "#{__dir__}/iso_sts/release_date"
    autoload :CommRef, "#{__dir__}/iso_sts/comm_ref"
    autoload :Secretariat, "#{__dir__}/iso_sts/secretariat"
    autoload :MetaDate, "#{__dir__}/iso_sts/meta_date"
    autoload :ContentLanguage, "#{__dir__}/iso_sts/content_language"
    autoload :StandardRef, "#{__dir__}/iso_sts/standard_ref"

    # Section elements
    autoload :Sec, "#{__dir__}/iso_sts/sec"
    autoload :TermSec, "#{__dir__}/iso_sts/term_sec"
    autoload :NonNormativeNote, "#{__dir__}/iso_sts/non_normative_note"
    autoload :NonNormativeExample, "#{__dir__}/iso_sts/non_normative_example"

    # Inline/block elements
    autoload :Paragraph, "#{__dir__}/iso_sts/paragraph"
    autoload :InlineFormula, "#{__dir__}/iso_sts/inline_formula"
    autoload :DispFormula, "#{__dir__}/iso_sts/disp_formula"
    autoload :Std, "#{__dir__}/iso_sts/std"
    autoload :StdRef, "#{__dir__}/iso_sts/std_ref"
    autoload :StyledContent, "#{__dir__}/iso_sts/styled_content"
    autoload :Preformat, "#{__dir__}/iso_sts/preformat"
    autoload :Xref, "#{__dir__}/iso_sts/xref"
    autoload :ExtLink, "#{__dir__}/iso_sts/ext_link"
    autoload :Break, "#{__dir__}/iso_sts/break"
    autoload :Sub, "#{__dir__}/iso_sts/sub"
    autoload :Sup, "#{__dir__}/iso_sts/sup"
    autoload :Label, "#{__dir__}/iso_sts/label"
    autoload :Title, "#{__dir__}/iso_sts/title"
    autoload :Bold, "#{__dir__}/iso_sts/bold"
    autoload :Italic, "#{__dir__}/iso_sts/italic"
    autoload :Monospace, "#{__dir__}/iso_sts/monospace"
    autoload :NamedContent, "#{__dir__}/iso_sts/named_content"
    autoload :Sc, "#{__dir__}/iso_sts/sc"
    autoload :Strike, "#{__dir__}/iso_sts/strike"
    autoload :Underline, "#{__dir__}/iso_sts/underline"
    autoload :Uri, "#{__dir__}/iso_sts/uri"

    # List elements
    autoload :List, "#{__dir__}/iso_sts/list"
    autoload :ListItem, "#{__dir__}/iso_sts/list_item"
    autoload :DefList, "#{__dir__}/iso_sts/def_list"
    autoload :DefItem, "#{__dir__}/iso_sts/def_item"
    autoload :Term, "#{__dir__}/iso_sts/term"
    autoload :Def, "#{__dir__}/iso_sts/def"

    # Table elements
    autoload :TableWrap, "#{__dir__}/iso_sts/table_wrap"
    autoload :Table, "#{__dir__}/iso_sts/table"
    autoload :Thead, "#{__dir__}/iso_sts/thead"
    autoload :Tbody, "#{__dir__}/iso_sts/tbody"
    autoload :Tfoot, "#{__dir__}/iso_sts/tfoot"
    autoload :Tr, "#{__dir__}/iso_sts/tr"
    autoload :Th, "#{__dir__}/iso_sts/th"
    autoload :Td, "#{__dir__}/iso_sts/td"
    autoload :Col, "#{__dir__}/iso_sts/col"
    autoload :Colgroup, "#{__dir__}/iso_sts/colgroup"
    autoload :Caption, "#{__dir__}/iso_sts/caption"
    autoload :TableWrapFoot, "#{__dir__}/iso_sts/table_wrap_foot"
    autoload :Array, "#{__dir__}/iso_sts/array"

    # Figure/graphic
    autoload :Fig, "#{__dir__}/iso_sts/fig"
    autoload :Graphic, "#{__dir__}/iso_sts/graphic"

    # Reference elements
    autoload :RefList, "#{__dir__}/iso_sts/ref_list"
    autoload :Ref, "#{__dir__}/iso_sts/ref"
    autoload :MixedCitation, "#{__dir__}/iso_sts/mixed_citation"

    # Back matter
    autoload :AppGroup, "#{__dir__}/iso_sts/app_group"
    autoload :App, "#{__dir__}/iso_sts/app"
    autoload :AnnexType, "#{__dir__}/iso_sts/annex_type"
    autoload :FnGroup, "#{__dir__}/iso_sts/fn_group"
    autoload :Fn, "#{__dir__}/iso_sts/fn"

    # MathML2 wrapper
    autoload :Mathml2, "#{__dir__}/iso_sts/mathml2"
  end
end

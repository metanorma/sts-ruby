# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Paragraph target and named-content round-trip" do # rubocop:disable RSpec/DescribeClass
  let(:named) { '<named-content content-type="k">nc</named-content>' }

  def wrap(body)
    <<~XML
      <standard xmlns:xlink="http://www.w3.org/1999/xlink"><front><iso-meta><doc-ident><sdo>ISO</sdo><proj-id>1</proj-id><language>en</language><release-version>IS</release-version><urn>urn:x</urn></doc-ident></iso-meta></front><body><sec id="s"><title>T</title>#{body}</sec></body></standard>
    XML
  end

  def reserialize(klass, body)
    klass.from_xml(wrap(body)).to_xml
  end

  {
    "IsoSts" => [Sts::IsoSts::Standard, 't1" target-type="x'],
    "NisoSts" => [Sts::NisoSts::Standard, 't1" content-type="x'],
  }.each do |name, (klass, target_attrs)|
    describe name do
      let(:para) do
        "<p>a <target id=\"#{target_attrs}\"/>b #{named} c</p>"
      end

      it "keeps target and named-content" do
        out = reserialize(klass, para)
        expect(out).to include("<target")
        expect(out).to include(named)
      end

      it "preserves attributes and text order" do
        out = reserialize(klass, para)
        pattern = "<p>a <target id=\"t1\"[^>]*(/>|></target>)" \
                  "b #{Regexp.escape(named)} c</p>"
        expect(out).to match(Regexp.new(pattern))
      end

      it "keeps repeated elements in document order" do
        body = '<p><named-content content-type="a">1</named-content>' \
               'x<named-content content-type="b">2</named-content></p>'
        out = reserialize(klass, body)
        expect(out).to include(
          '<named-content content-type="a">1</named-content>x' \
          '<named-content content-type="b">2</named-content>',
        )
      end
    end
  end
end

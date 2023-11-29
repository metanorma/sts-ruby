# frozen_string_literal: true

module FixturesHelper
  def fixtures_path(path = "")
    File.join(File.expand_path("../fixtures", __dir__), path)
  end
end

RSpec.configure do |c|
  c.include FixturesHelper
end

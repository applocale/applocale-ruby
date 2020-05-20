require "test_helper"

class AppLocale::VersionTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::AppLocale::VERSION
  end
end

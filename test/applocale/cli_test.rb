require "test_helper"

class Applocale::CliTest < Minitest::Test
  def test_version_command
    assert_output("AppLocale Version: #{AppLocale::VERSION}\n") { AppLocale::Cli.start(["version"]) }
  end

  def test_init_command
    within_tmp_dir do
      AppLocale::Cli.start(["init"])
      assert_path_exists "config/applocale.yml"
    end
  end

  def test_init_command_when_config_exists
    within_tmp_dir do
      Dir.mkdir "config"
      FileUtils.cp config_fixture, "config"
      assert_path_exists "config/applocale.yml"
      assert_output(/identical  config\/applocale.yml/) { AppLocale::Cli.start(["init"]) }
    end
  end
end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "applocale/ruby"
require "minitest/autorun"
require "pry"
require "fileutils"
require "minitest/reporters"

Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new

def fixture_path(path)
  File.join(File.dirname(__FILE__), "fixtures", path)
end

def fixture_file(path)
  File.read(fixture_path(path))
end

def config_fixture
  fixture_path("applocale.yml")
end

def within_tmp_dir
  Dir.mkdir("test/tmp") unless Dir.exist?("test/tmp")
  Dir.chdir "test/tmp" do
    yield
  end
  FileUtils.remove_dir("test/tmp/")
end

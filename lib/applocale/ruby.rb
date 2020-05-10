# This ruby.rb file is required to keep the gem working properly since the
# applocale gem was already taken :(
# But we want to name our gem files AppLocale anyway and the commands the same.

require "applocale/version"
require "applocale/client"
require "applocale/cli"
require "applocale/config"

# BaseCommand holds configuration option used in various other classes
require "applocale/base_command"
require "applocale/pull"
require "applocale/file_writer"

module Applocale
  module Ruby
    class Error < StandardError; end
  end
end

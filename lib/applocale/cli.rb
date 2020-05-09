require "thor"

module AppLocale
  class Cli < ::Thor
    desc "version", "Print the current version"
    def version
      puts "AppLocale Version: #{AppLocale::VERSION}"
    end
  end
end

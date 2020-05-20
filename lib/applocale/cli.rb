require "thor"

module AppLocale
  class Cli < ::Thor
    class_option "config-file",
      default: "config/applocale.yml",
      desc: "Customize the location of the config file"
    class_option "verbose",
      type: :boolean,
      desc: "Turn on additional logging, helpful for debugging."

    desc "pull [en es]", "Downloads all translations, optionally pass specifc locales"
    long_desc <<-LONGDESC
    `applocale pull` will fetch all locales from AppLocale.

    You can optionally specify language codes, which will only
    fetch locales for those specifc languages.

    > $ applocale pull en es de
    LONGDESC
    def pull(*languages)
      AppLocale::Pull.new(config, options).call(languages)
    end

    desc "version", "Print the current version"
    def version
      puts "AppLocale Version: #{AppLocale::VERSION}"
    end

    private

    def config
      @config ||= AppLocale::Config.load(options["config-file"])
    end
  end
end

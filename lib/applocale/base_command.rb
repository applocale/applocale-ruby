module AppLocale
  class BaseCommand
    attr_accessor(:config, :options)

    def initialize(config, options)
      @config = config
      @options = options
    end
  end
end

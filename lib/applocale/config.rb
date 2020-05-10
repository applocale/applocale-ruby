require "erb"
require "yaml"

module AppLocale
  class Config
    attr_accessor(:config_file, :configuration_data, :api_key, :project_id, :locale_directory)

    def self.load(config_file)
      new(config_file)
    end

    def initialize(config_file)
      @config_file = config_file
      parse_config_file!
      @api_key = env_or_config_value('api_key')
      @project_id = env_or_config_value('project_id')
      @locale_directory = env_or_config_value('locale_directory', default: 'config/locales')
    end

    def parse_config_file!
      validate_config_file!

      file_content = File.read(config_file_path)
      parsed_config_file = ERB.new(file_content).result
      @configuration_data = YAML.load(parsed_config_file).dig("applocale") || {}
    end

    def validate_config_file!
      unless File.exists?(config_file_path)
        puts "[AppLocale] Error: #{config_file_path} does not exist."
        exit 1
      end

      unless File.readable?(config_file_path)
        puts "[AppLocale] Error: #{config_file_path} is not readable by AppLocale."
        exit 1
      end
    end

    private

    def config_file_path
      File.expand_path(config_file)
    end

    def env_or_config_value(key, required: true, default: nil)
      value = ENV["APPLOCALE_#{key.upcase}"] || configuration_data.dig(key.to_s)
      if required && (!value || value == "") && !default
        raise ArgumentError, "Missing APPLOCALE_#{key.upcase} or key in config/applocale.yml"
      end
      value || default
    end

    def config_value_or_default(key, default: nil)
      configuration_data.dig(key.to_s) || default
    end
  end
end

require "fileutils"

module AppLocale
  class FileWriter < AppLocale::BaseCommand
    def call(response)
      create_locale_directory unless File.directory?(config.locale_directory)

      relative_file_path = "#{config.locale_directory}/#{response.dig("language_code")}.yml"
      file_path = File.expand_path(relative_file_path)
      File.write(file_path, response.dig("yaml"))
      puts "[AppLocale] ↳ Wrote translations for #{response.dig("language_code")} to #{relative_file_path}"
    end

    private

    def create_locale_directory
      FileUtils.mkdir_p(config.locale_directory)
      puts "[AppLocale] Created #{config.locale_directory} directory"
    end
  end
end

module AppLocale
  class Pull < AppLocale::BaseCommand
    def call(languages)
      # The user did not pass in specifc languages to ask AppLocale about.
      # Let's fetch the languages for the project and then loop over them.
      if languages.empty?
        puts "[AppLocale] Fetching list of languages..."
        response = client.project_information
        if response.dig("success")
          languages = response.dig("languages")
          puts "[AppLocale] ↳ Received #{languages} from AppLocale..." if options[:verbose]
        else
          puts "[AppLocale] #{response.dig("message")}"
          exit 1
        end
      end

      if languages.any?
        languages.each do |language_code|
          puts "[AppLocale] Fetching translations for #{language_code}..."
          response = client.export(language_code)
          if response.dig("success")
            puts "[AppLocale] ↳ Received #{response} from AppLocale" if options[:verbose]
            AppLocale::FileWriter.new(config, options).call(response)
          else
            puts "[AppLocale] #{response.dig("message")}"
            exit 1
          end
        end
      else
        puts "[AppLocale] Sorry, no languages were found for the project."
        exit 1
      end
    end

    private

    def params
      { api_key: config.api_key, project_id: config.project_id, base_uri: config.host }
    end

    def client
      @client ||= AppLocale::Client.new(params)
    end
  end
end

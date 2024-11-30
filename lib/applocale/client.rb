require "httparty"

module AppLocale
  class Client
    include HTTParty
    attr_reader(:params)

    def initialize(params = {})
      @params = params
    end

    # Required params:
    # - api_key
    # - project_id
    #
    # Optionally:
    # - locale
    # pass single code of language for export
    def export(language = nil)
      request(:export, body: export_params(language))
    end

    def project_information
      request(:project_show)
    end

    private

    def project_id
      params[:project_id]
    end

    def export_params(language)
      export_params = { project_id: project_id }
      if language
        export_params[:locale] = language
      end
      export_params
    end

    def request(action, body: {}, options: {})
      HTTParty.send(
        routes[action][:method],
        routes[action][:endpoint],
        base_payload(body, options)
      ).parsed_response
    end

    # rubocop: disable Metrics/MethodLength
    def routes
      {
        project_show: {
          method: :get,
          endpoint: "#{base_uri}/projects/#{project_id}"
        },
        export: {
          method: :post,
          endpoint: "#{base_uri}/exports"
        }
      }
    end
    # rubocop: enable Metrics/MethodLength

    def base_payload(body = {}, options = {})
      {
        headers: {
          "Accept" => "application/json",
          "Authorization" => "Bearer #{params[:api_key]}",
          "User-Agent" => "AppLocale-Ruby:#{AppLocale::VERSION}"
        },
        body: body
      }.merge(options)
    end

    # Private: base_uri
    def base_uri
      params[:base_uri] + "/api/v1"
    end
  end
end

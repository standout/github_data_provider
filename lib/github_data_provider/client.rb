# frozen_string_literal: true

require "net/http"
require "uri"

module GithubDataProvider
  class Client
    GITHUB_API_URL = "https://api.github.com"

    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def get(uri)
      uri = URI("#{GITHUB_API_URL}#{uri}")
      request = Net::HTTP::Get.new(uri)
      request["Accept"] = "application/vnd.github.v3+json"
      request["Authorization"] = "token #{configuration.token}"

      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(request)
      end

      response.body
    end
  end
end

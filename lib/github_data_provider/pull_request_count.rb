module GithubDataProvider
  class PullRequestCount
    Response = Struct.new(:data, :expires_in)

    def initialize(options = {})
      @options = options
      set_options_defaults
    end

    def fetch
      Response.new(
        [ClosedPRCountLeaderboard.new(source_data).parse],
        expires_in
      )
    end

    private

    def source_data
      JSON.parse(client.get(endpoint_uri))
    end

    def client
      @_client ||= GithubDataProvider::Client.new(GithubDataProvider.configuration)
    end

    def endpoint_uri
      "/search/issues?q=type:pr+org:#{@options[:org]}"
    end

    def set_options_defaults
      @options[:org] ||= "Standout"
    end

    def expires_in
      60**2
    end
  end
end

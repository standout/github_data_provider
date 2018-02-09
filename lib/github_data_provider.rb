# frozen_string_literal: true

require_relative "github_data_provider/version"
require_relative "github_data_provider/configuration"
require_relative "github_data_provider/client"

module GithubDataProvider

  class << self
    attr_reader :configuration

    # Configure the provider.
    #
    # @example
    #   GithubDataProvider.configure do |config|
    #     config.username = "ragnar-lodbrok"
    #     config.password = "kfjdhkrheluiwh843yfkhfhfdjkg"
    #   end
    def configure(&_block)
      yield(configuration)
      configuration.freeze
    end

    # Reset the state of the configuration.
    #
    # @api private
    def reset!
      @configuration = Configuration.new
    end
  end

  reset!
end

# frozen_string_literal: true

module GithubDataProvider
  class Configuration
    attr_accessor :token

    def initialize(attributes = {})
      @token = nil

      attributes.each do |key, value|
        public_send "#{key}=", value
      end
    end
  end
end

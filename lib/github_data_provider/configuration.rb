# frozen_string_literal: true

module GithubDataProvider
  class Configuration
    attr_accessor :username, :password

    def initialize(attributes = {})
      @username = nil
      @password = nil

      attributes.each do |key, value|
        public_send "#{key}=", value
      end
    end
  end
end

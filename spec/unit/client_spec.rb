# frozen_string_literal: true

module GithubDataProvider
  RSpec.describe Client do
    let(:configuration) { { token: "my_token" } }
    let(:client) { Client.new(configuration) }

    describe "#get" do
      it "creates a GET request to Githubs API" do
        stub_request(:get, "https://api.github.com/user/repos")
        client.get "/user/repos"
      end
    end
  end
end

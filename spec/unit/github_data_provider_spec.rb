# frozen_string_literal: true

RSpec.describe GithubDataProvider do
  it "has a version file" do
    expect(File.expand_path("../../lib/github_data_provider/version.rb", __dir__)).to be_a_file
  end

  it "has a version number" do
    expect(GithubDataProvider::VERSION).to be_a(String)
  end

  describe ".configure" do
    it "yields the configuration object" do
      GithubDataProvider.configure do |config|
        expect(config).to be_a(GithubDataProvider::Configuration)
      end
    end
  end
end

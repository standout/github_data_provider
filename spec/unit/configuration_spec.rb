# frozen_string_literal: true

module GithubDataProvider
  RSpec.describe Configuration do
    describe "#initialize" do
      context "attributes passed as a hash" do
        it "sets the given attributes" do
          config = Configuration.new(username: "standout")
          expect(config.username).to eq("standout")
        end

        it "raises an error if attribute is unknown" do
          expect {
            Configuration.new(invalid: "standout")
          }.to raise_error(NoMethodError)
        end
      end
    end
  end
end

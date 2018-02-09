# frozen_string_literal: true

RSpec.describe GithubDataProvider::PullRequestCount do
  let(:default_response_body) do
    {
      "total_count" => 280,
      "incomplete_results" => false,
      "items" => [
        {
          "user" => {
            "login" => "Bob",
            "id" => 1,
            "avatar_url" => "https://secure.gravatar.com/avatar/934442aadfe3b2f4630510de416c5718?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
          },
          "created_at" => "2009-07-12T20:10:41Z",
          "updated_at" => "2009-07-19T09:23:43Z",
          "closed_at" => nil,
        }
      ]
    }
  end
  let(:url) { "https://api.github.com/search/issues?q=type:pr+org:Standout" }

  it "expires in an hour" do
    stub_request(:get, url).to_return(body: default_response_body.to_json)
    service = GithubDataProvider::PullRequestCount.new

    response = service.fetch

    expect(response.expires_in).to eq 60**2
  end

  it "returns an array with data" do
    stub_request(:get, url).to_return(body: default_response_body.to_json)
    service = GithubDataProvider::PullRequestCount.new

    response = service.fetch

    expect(response.data).to be_a_kind_of Array
  end
end

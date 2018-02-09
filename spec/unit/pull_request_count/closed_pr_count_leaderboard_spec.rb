# frozen_string_literal: true

require "github_data_provider/pull_request_count/closed_pr_count_leaderboard"

RSpec.describe GithubDataProvider::PullRequestCount::ClosedPRCountLeaderboard do
  let(:source_data) do
    {
      "total_count": 280,
      "incomplete_results": false,
      "items": [
        {
          "user": { "login": "Bob", "id": 1,
            "avatar_url": "https://secure.gravatar.com/avatar/934442aadfe3b2f4630510de416c5718?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
          },
          "created_at": "2009-07-12T20:10:41Z",
          "updated_at": "2009-07-19T09:23:43Z",
          "closed_at": nil,
        }
      ]
    }
  end

  it "counts closed pull requests for a login" do
    source_data = {
      "items" => [
        {
          "user" => { "login" => "Bob" },
          "state" => "closed"
        },
        {
          "user" => { "login" => "Fredrik" },
          "state" => "open"
        },
        {
          "user" => { "login" => "Bob" },
          "state" => "closed"
        }
      ]
    }

    data = GithubDataProvider::PullRequestCount::ClosedPRCountLeaderboard.new(source_data).parse

    expect(data).to include(
      data: [
        [ "Bob", 2],
        [ "Fredrik", 0],
      ]
    )
  end

  it "includes metadata" do
    source_data = {
      "items" => []
    }

    data = GithubDataProvider::PullRequestCount::ClosedPRCountLeaderboard.new(source_data).parse

    expect(data).to include(
      type: "table",
      title: "Antal pull requests",
      meta: { headers: ['Namn', 'Stängda'] }
    )
  end

  it "sorts the entries" do
    source_data = {
      "items" => [
        {
          "user" => { "login" => "Bob" },
          "state" => "closed"
        },
        {
          "user" => { "login" => "Fredrik" },
          "state" => "open"
        },
        {
          "user" => { "login" => "Bob" },
          "state" => "closed"
        },
        {
          "user" => { "login" => "BruceTheAllmighty" },
          "state" => "closed"
        },
        {
          "user" => { "login" => "BruceTheAllmighty" },
          "state" => "closed"
        },
        {
          "user" => { "login" => "BruceTheAllmighty" },
          "state" => "closed"
        }
      ]
    }

    data = GithubDataProvider::PullRequestCount::ClosedPRCountLeaderboard.new(source_data).parse

    expect(data).to include(
      {
        data: [
          [ "BruceTheAllmighty", 3],
          [ "Bob", 2],
          [ "Fredrik", 0],
        ]
      }
    )
  end
end

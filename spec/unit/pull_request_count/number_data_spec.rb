# # frozen_string_literal: true

# require "github_data_provider/pull_request_count/number_data"

# RSpec.describe GithubDataProvider::PullRequestCount::TableData do
#   it "counts closed pull requests for a login" do
#     source_data = {
#       "items" => [
#         {
#           "user" => {
#             "login" => "Bob",
#             "id" => 1
#           },
#           "state" => "closed"
#         },
#         {
#           "user" => {
#             "login" => "Fredrik",
#             "id" => 2
#           },
#           "state" => "open"
#         },
#         {
#           "user" => {
#             "login" => "Bob",
#             "id" => 1
#           },
#           "state" => "closed"
#         }
#       ]
#     }

#     data = GithubDataProvider::PullRequestCount::TableData.new(source_data).parse

#     expect(data).to include(
#       data: [
#         [ "Bob", 2],
#         [ "Fredrik", 0],
#       ]
#     )
#   end

#   it "includes metadata" do
#     source_data = {
#       "items" => []
#     }

#     data = GithubDataProvider::PullRequestCount::TableData.new(source_data).parse

#     expect(data).to include(
#       type: "table",
#       title: "Antal pull requests",
#       meta: { headers: ['Namn', 'Stängda'] }
#     )
#   end
# end

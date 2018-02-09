module GithubDataProvider
  class ClosedPRCountLeaderboard
    # Expects the source data as a hash
    def initialize(source_data)
      @source_data = source_data
    end

    def parse
      {
        type: "table",
        title: "Antal pull requests idag",
        meta: { headers: ['Namn', 'Stängda'] },
        data: array_data
      }
    end

    private

    def hash_data
      @source_data["items"].each_with_object({}) do |item, hash|
        hash[item["user"]["login"]] ||= 0
        hash[item["user"]["login"]] += 1
      end
    end

    def array_data
      hash_data.map(&:to_a).sort_by {|_k, v| v }.reverse
    end
  end
end

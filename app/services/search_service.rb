# frozen_string_literal: true
class SearchService
  class << self
    def push_to_redis(redis, query)
      redis.lpush(
        "ip:#{query[:ip]}",
        {
          query: query[:value],
          created_at: DateTime.now.strftime('%Q')
        }.to_json
      )
    end
  end
end

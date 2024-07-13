class SearchService
  class << self
    def push_to_redis(query)
      RedisService.lpush(
        "ip:#{query[:ip]}",
        {
          query: query[:value],
          created_at: DateTime.now.strftime('%Q')
        }.to_json
      )
    end

    def insert(query)
      Search.where(query: query.downcase).first_or_create!
    end
  end
end

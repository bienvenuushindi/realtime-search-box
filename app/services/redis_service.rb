class RedisService
  class << self
    def fetch_queries(pattern)
      REDIS.scan_each(match: pattern).to_a
    end

    def lindex(key, index)
      JSON.parse(REDIS.lindex(key, index))
    end

    def lpush(key, value)
      REDIS.lpush(key, value)
    end

    def del(key)
      REDIS.del(key)
    end
  end
end
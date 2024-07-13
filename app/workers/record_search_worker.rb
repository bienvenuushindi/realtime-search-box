class RecordSearchWorker
  include Sidekiq::Job

  def perform
    puts 'Sidekiq has started consuming...................'
    users_queries = RedisService.fetch_queries('ip:*')
    return puts 'No item at the moment' if users_queries.empty?

    users_queries.each do |key|
      consume(key) if REDIS.type(key) == 'list'
    end

    puts 'Sidekiq has finished consuming...................'
  end

  private

  def consume(key)
    last_item = RedisService.lindex(key, 0)
    return unless right_interval?(last_item['created_at'])

    SearchService.insert(last_item['query'])
    RedisService.del(key)
  end

  def right_interval?(time1, time2 = DateTime.now.strftime('%Q'))
    (time2.to_i - time1.to_i).abs >= 10000
  end
end

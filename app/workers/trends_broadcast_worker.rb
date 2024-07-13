# frozen_string_literal: true

class TrendsBroadcastWorker
  include Sidekiq::Job

  def perform
    trends = Search.trends
    Turbo::StreamsChannel.broadcast_replace_to(
      :trends,
      target: 'trends',
      partial: 'searches/trends',
      locals: { trends: trends }
    )
  end
end

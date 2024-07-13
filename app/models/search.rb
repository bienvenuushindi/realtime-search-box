class Search < ApplicationRecord
  validates :count, numericality: { greater_than_or_equal_to: 0 }
  def self.trends
    order(count: :desc).limit(10)
  end

  def self.insert_query(query)
    search = find_or_initialize_by(query: query.strip.downcase)
    search.count += 1
    search.save!
    search
  end
end

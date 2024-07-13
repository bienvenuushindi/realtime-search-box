class Article < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search, against: %i[title], using: { tsearch: { prefix: true, normalization: 8 } }
  validates :title, presence: true
end

class Search < ApplicationRecord

  validates :count, numericality: { greater_than_or_equal_to: 0 }
  before_save :update_count
  def update_count
    increment!(:count)
  end
end

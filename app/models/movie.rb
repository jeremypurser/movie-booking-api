class Movie < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :runtime, presence: true
  validates :buffer, presence: true

  paginates_per 10
end

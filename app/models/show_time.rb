class ShowTime < ApplicationRecord
  belongs_to :movie

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :seat_count, presence: true
  validates_with ShowTimeValidator

  scope :filter_by_start_time, ->(start_time) { where start_time: start_time }
  scope :filter_by_end_time, ->(end_time) { where end_time: end_time }
  scope :filter_by_seat_count, ->(seat_count) { where seat_count: seat_count }
  scope :filter_by_movie_id, ->(movie_id) { where movie_id: movie_id }

  paginates_per 10
end

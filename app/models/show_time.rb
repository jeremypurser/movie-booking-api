class ShowTime < ApplicationRecord
  belongs_to :movie

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :seat_count, presence: true
  validates_with ShowTimeValidator
end

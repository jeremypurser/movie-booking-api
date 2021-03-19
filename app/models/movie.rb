class Movie < ApplicationRecord
  extend Filterable

  has_many :movies

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :runtime, presence: true
  validates :buffer, presence: true

  scope :filter_by_name, ->(name) { where name: name }
  scope :filter_by_runtime, ->(runtime) { where runtime: runtime }
  scope :filter_by_buffer, ->(buffer) { where buffer: buffer }
  scope :filter_by_details, ->(details) { where details: details }

  paginates_per 10
end

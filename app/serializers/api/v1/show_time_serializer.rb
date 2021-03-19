# frozen_string_literal

module Api::V1
  class ShowTimeSerializer < ApplicationSerializer
    attributes :id, :movie_id, :start_time, :end_time, :seat_count
  end
end

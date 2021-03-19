# frozen_string_literal: true

module Api::V1
  class ShowTimesController < ApiController
    before_action :admin_access

    # POST /api/v1/showtimes
    def create
      show_time = ShowTime.new(show_time_params)

      if show_time.save
        success_response(show_time, 201)
      else
        error_response(show_time.errors.messages)
      end
    end

    private

    def show_time_params
      params.permit(:start_time, :end_time, :seat_count, :movie_id)
    end
  end
end

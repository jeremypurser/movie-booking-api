# frozen_string_literal: true

module Api::V1
  class ShowTimesController < ApiController
    before_action :admin_access

    # GET /api/v1/showtimes
    def index
      show_times = ShowTime.filter(filtering_params).page(params[:page])

      render json: show_times, meta: { pagination: pagination(show_times) }
    end

    # POST /api/v1/showtimes
    def create
      show_time = ShowTimeProcessor.call(
        start_time: show_time_params[:start_time],
        end_time: show_time_params[:end_time],
        params: show_time_params
      )

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

    def filtering_params
      params.slice(:start_time, :end_time, :seat_count, :movie_id)
    end
  end
end

module Api::V1
  class ApiController < ApplicationController
    include JwtAuthenticatable

    def success_response(object, status = 200)
      render json: object, status: status
    end

    def error_response(payload, status = 400)
      render json: { data: nil, errors: payload }, status: status
    end

    def pagination(object)
      {
        current_page: object.current_page,
        next_page: object.next_page,
        prev_page: object.prev_page,
        total_pages: object.total_pages,
        total_count: object.total_count
      }
    end
  end
end

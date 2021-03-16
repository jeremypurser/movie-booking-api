module Api
  module V1
    class ApiController < ApplicationController
      include JwtAuthenticatable

      def success_response(object, status = 200)
        render json: object, status: status
      end

      def error_response(payload, status = 400)
        render json: { data: nil, errors: payload }, status: status
      end
    end
  end
end

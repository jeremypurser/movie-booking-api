module Api
  module V1
    class ApiController < ApplicationController
      include JwtAuthenticatable

      before_action :authorized

      def success_response(object)
        render json: object
      end

      def created_response(object)
        render json: object, status: :created
      end

      def error_response(payload, status)
        render json: { data: nil, errors: payload }, status: status
      end
    end
  end
end

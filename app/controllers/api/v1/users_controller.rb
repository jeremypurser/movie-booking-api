# frozen_string_literal: true

module Api::V1
  class UsersController < ApiController
    # Register
    # POST /api/v1/register
    def create
      user = User.create(user_params)

      if user.valid?
        success_response(data: user, status: 201)
      else
        error_response('Invalid username or password', :unauthorized)
      end
    end

    # POST /api/v1/login
    def login
      user = User.find_by(email: user_params[:email])

      if user&.authenticate(user_params[:password])
        success_response(data: user)
      else
        error_response('Invalid username or password', :unauthorized)
      end
    end

    private

    def user_params
      params.permit(:email, :password, :admin)
    end
  end
end

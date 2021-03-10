module Api
  module V1
    class UsersController < ApiController
      before_action :authorized, only: [:test]

      # Register
      # POST /api/v1/register
      def create
        user = User.create(user_params)

        if user.valid?
          render json: user, status: :created
        else
          head(:unauthorized)
          render json: { error: 'Invalid username or password' }
        end
      end

      # POST /api/v1/login
      def login
        user = User.find_by(email: user_params[:email])

        if user&.authenticate(user_params[:password])
          render json: user
        else
          render json: { error: 'Invalid username or password' }
        end
      end

      def test
        render json: { message: 'Success' }
      end

      private

      def user_params
        params.permit(:email, :password, :admin)
      end
    end
  end
end

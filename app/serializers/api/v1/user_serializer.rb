module Api
  module V1
    class UserSerializer < ApplicationSerializer
      attributes :id, :email, :token

      def token
        encode_token(user_id: object.id)
      end
    end
  end
end

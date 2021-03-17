# frozen_string_literal: true

module Api::V1
  class UserSerializer < ApplicationSerializer
    attributes :id, :email, :token

    def token
      encode_token(user_id: object.id, admin: object.admin)
    end
  end
end

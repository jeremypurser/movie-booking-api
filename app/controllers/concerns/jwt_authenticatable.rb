# frozen_string_literal: true

module JwtAuthenticatable
  extend ActiveSupport::Concern

  # Returns secret
  #
  # @return {String}
  def secret
    Rails.application.secrets.secret_key_base
  end

  # Returns hasing algorithm
  #
  # @return {String}
  def jwt_algorithm
    'HS256'
  end

  # Returns authorization header from http request
  #
  # @return {String}
  def auth_header
    request.headers['Authorization']
  end

  # Returns JWT
  #
  # @return {String}
  def encode_token(payload)
    JWT.encode(payload, secret)
  end

  # Return JWT or empty string
  #
  # @return {String}
  def token_from_header
    return '' unless auth_header

    token = auth_header.split(' ')

    if token[0].downcase != 'bearer'
      ''
    else
      token[1] || ''
    end
  end

  # Returns decoded JWT or nil
  #
  # @return {Hash | nil}
  def decode_token
    return unless token_from_header

    JWT.decode(
      token_from_header,
      secret,
      true,
      algorithm: jwt_algorithm
    )
  rescue StandardError => e
    Rails.logger.error(e.message)
    nil
  end

  # Returns the logged in user or nil
  #
  # @return {User | nil}
  def logged_in_user
    return unless decode_token

    user_id = decode_token[0]['user_id']
    User.find(user_id)
  end

  # Sends error response if token is invalid
  #
  # @return {Hash | nil}
  def authorize
    error_response('Must log in', :unauthorized) unless logged_in_user
  end
end

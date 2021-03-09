module Authorization
  SECRET = Rails.application.secrets.secret_key_base
  ALGO = 'HS256'.freeze

  # Returns authorization header from http request
  #
  # return {String}
  def auth_header
    request.headers['Authorization']
  end

  # Returns JWT
  #
  # return {String}
  def encode_token(payload)
    JWT.encode(payload, SECRET)
  end

  # Returns decoded JWT or nil
  #
  # return {Hash | nil}
  def decode_token
    return unless auth_header

    token = auth_header.split(' ')[1]
    JWT.decode(token, SECRET, true, algorithm: ALGO)
  end

  # Returns the logged in user or nil
  #
  # return {User | nil}
  def logged_in_user
    return unless decode_token

    user_id = decode_token[0]['user_id']
    User.find(user_id)
  end

  def authorized
    render json: { message: 'Must log in', status: :unauthorized } unless logged_in_user
  end
end

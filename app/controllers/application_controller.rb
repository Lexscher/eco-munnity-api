coclass ApplicationController < ActionController::API
  # create a new token with the given payload
  def secret
    ENV["JWT_SECRET_KEY"]
  end

  def encode_token(payload)
    JWT.encode(payload, secret, "HS256")
  end

  # grab token from our headers
  def token
    request.headers["Authorization"]
  end

  # decode the token 
  def decoded_token
    JWT.decode(token, secret, { algorithm: "HS256"})
  end

  # Create the user payload
  def user_payload(user)
    { user_id: user.id }
  end

  # Current user by way of decoded token's id
  def current_user
		User.find(decoded_token[0]["user_id"])
	end
end

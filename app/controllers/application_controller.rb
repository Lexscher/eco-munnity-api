class ApplicationController < ActionController::API
  # create a new token with the given payload
  def encode_token(payload)
    token = JWT.encode(payload, ENV["JWT_SECRET_KEY"], "HS256")
  end

  # Create the user payload
  def user_payload(user)
    { user_id: user.id }
  end
end

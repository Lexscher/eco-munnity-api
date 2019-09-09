class AuthController < ApplicationController
  # find user then create token
  def login
    # grab the current user
    user = User.find_by(username: params[:username])
    # check if the user is authentic
    is_authenticated = user.authenticate(params[:password])
    # If they're authenticated
    if is_authenticated
      # return the user json
      render json: { token: encode_token(user_payload(user)), user: user }
    else
      # send an error message
      render json: { errors: "Sorry!! Wrong username and password combination.", message: "No soup for you!" }
    end
  end
end

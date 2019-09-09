class UsersController < ApplicationController
  
  # sign up and create token
  def create
    user = User.create(user_params)
    if user.valid?
      render json: { token: encode_token(user_payload(user)), user: user }
    else
      render json: { errors: user.errors.full_messages }, status: :not_acceptable
    end
  end

  def profile
    render json: { user: current_user }
  end

  def show
    user = User.find(params["username"])
    render json: user
  end

  def destroy
    User.destroy(current_user)
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :username, :email, :password)
  end
end

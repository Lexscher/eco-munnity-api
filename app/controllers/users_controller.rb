class UsersController < ApplicationController
  
  # sign up and create token
  def create
    user = User.create(user_params)
    if user.valid?
      render json: { token: encode_token(user_payload(user)), user_info: user }
    else
      render json: { errors: user.errors.full_messages }, status: :not_acceptable
    end
  end

  def profile
    render json: current_user
  end

  def show
    selected_user = User.find(params["id"])
    if selected_user == current_user
      render json: current_user
    else
      render json: selected_user
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :username, :email, :password)
  end
end

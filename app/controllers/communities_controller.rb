class CommunitiesController < ApplicationController

  def index
    communities = Community.all
    render json: communities, status: :ok
  end

  def show
   community = Community.find(params["id"])
   render json: community, status: :ok
  end

  # Beyond this point, user must be logged in...
  def create
    # If you're logged in
    if current_user
      # Create a community
      community = current_user.communities.create(community_params)
      # If it was created successfully
      if community.valid?
        # render the new community
        render json: community, status: :created
      else
        # send the errors
        render json: { errors: community.errors.full_messages }, status: :bad_request
      end
    else
      # tell the user they aren't logged in
      render json: { message: "You must be logged in to create a community!" }, status: :unauthorized
    end
  end

  def update
    if current_user
      # Find the community
      community = Community.find(params["id"])
      # if the current user is the one that initially created the community
      if community.user == current_user
        # they can update it!
        community.update!(community_params)
        # If the community was updated
        if community.valid?
          # show the community
          render json: community, status: :created
        else
          # show the errors
          render json: { errors: community.errors.full_messages }, status: :bad_request
        end
      else
        render json: { message: "You must be the creator to edit a community!" }, status: :unauthorized
      end
    else
      render json: { message: "You must log in to edit a community!" }, status: :unauthorized
    end
  end

  def destroy
    # Find the community
    community = Community.find(params["id"])
    # if the user has created the community
    if community.user = current_user
      # destroy the community
      community.destroy
      # tell the user their item has been destroyed
      render json: { message: "Successfully deleted #{community.name}",  removed: community}, status: :ok
    else
      # tell the user they're not allowed to
      render json: { message: "Unauthorized"}, status: :unauthorized
    end
  end

  private

  def community_params
    params.permit(:name, :description)
  end

end

class JoinedCommunitiesController < ApplicationController

  def index
    # if there's a user that's logged in
    if current_user
      # Show the user the communities they've joined
      render json: current_user.joined_communities, status: :ok
    else
      # Tell them they need to sign in to see the communities they've joined
      render json: { message: "You must be logged in to perform this action!!"}, status: :unauthorized
    end
  end

  def create
    # if there's a user that's logged in
    if current_user
      # grab community
      community = Community.find(params["community_id"])
      # create a joined community
      jc = current_user.joined_communities.create(community: community)
      # if it was joined successfully
      if jc.valid?
        # tell the user
        render json: jc, status: :ok
      else
        # Tell the user that something went wrong
        render json: { errors: jc.errors.full_messages }, status: :bad_request
      end
    else
      # Tell them they need to sign in to join a community
      render json: { message: "You must be logged in to perform this action!!"}, status: :unauthorized
    end
  end

  def destroy
    # if there's a user that's logged in
    if current_user
      joined_community = JoinedCommunity.find(params["id"])
      # If this joined community belongs to the user
      if current_user == joined_community.user
        # destroy the joined_community
        joined_community.destroy
        render json: { message: "#{current_user.username} has left ../#{joined_community.community.name}"}
      else
        # Tell the user they can't leave a community for another user
        render json: { message: "You can't leave a community for another user."}, status: :unauthorized
      end
    else
      # Tell them they need to sign in to leave a community
      render json: { message: "You must be logged in to perform this action!!"}, status: :unauthorized
    end
  end

end

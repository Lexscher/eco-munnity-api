class CommunitiesController < ApplicationController

  def index
    communities = Community.all
    render json: communities
  end

  def show
   community = Community.find(params["id"])
   render json: community
  end

end

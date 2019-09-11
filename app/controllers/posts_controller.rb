class PostsController < ApplicationController

  def index
    posts = Post.all
    render json: PostSerializer.new(posts), status: :ok
  end

  def show
    post = Post.find(params["id"])
    render json: PostSerializer.new(post), status: :ok
  end

  # Beyond this point, user must be logged in...
  def create
    # If there's a user logged in
    if current_user
      # Create a new post under their name
      post = current_user.posts.create(post_params)
      # If the post was created successfully
      if post.valid?
        # render the post
        render json: post, status: :ok
      else
        # Show the errors
        render json: { errors: post.errors.full_messages }, status: :bad_request
      end
    else
      render json: { message: "You must log in to create a post!" }, status: :unauthorized
    end
  end

  def update
    # If there's a user logged in
    if current_user
      # Find that post
      post = Post.find(params["id"])
      # If the post belongs to the logged in user
      if current_user == post.user
        # update that post
        post.update!(post_params)
        # If the post was updated
        if post.valid?
        # render that updated post
        render json: post, status: :ok
        else
          # Tell the user that there were problems editing the post
          render json: { errors: post.errors.full_messages }, status: :bad_request
        end
      else
        # Tell the user they can't edit a post that isn't theirs
        render json: { message: "Unauthorized!"}, status: :unauthorized
      end
    else
      render json: { message: "You must log in to edit a post!" }, status: :unauthorized
    end
  end

  def destroy
    # If there's a user logged in
    if current_user
      # find the post
      post = Post.find(params["id"])
      # if the user is the creator of the post
      if current_user == post.user
        # destroy the post
        post.destroy
        # tell the user their post was deleted
        render json: { message: "Successfully deleted!", removed: post }, status: :ok
      else
        # Tell the user they can't delete some elses post
        render json: { message: "This post doesn't belong to you!!"}, status: :unauthorized
      end
    else
      render json: { message: "Please log in to delete a post!" }, status: :unauthorized
    end
  end

  private
  def post_params
    params.permit(:title, :content, :community_id)
  end
end

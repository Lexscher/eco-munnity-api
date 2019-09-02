class VotedPostsController < ApplicationController

  def index
    # If the user is logged in
    if current_user
      # grab all of their voted posts
      posts = current_user.voted
      # If they have liked any posts
      if posts.length > 0
        # render their posts
        render json: posts, status: :ok
      else
        # Tell them they should start liking people's posts
        render json: { message: "It looks like you haven't liked any posts yet."}
      end
    else
      # Tell the user they must be logged in to see their voted posts
      render json: { message: "Please log in to see the posts you've voted for."}, status: :unauthorized
    end
  end

  def create
    # If the user is logged in
    if current_user
      # Create the voted_post
      # byebug
      voted_post = current_user.voted_posts.create(voted_post_params)
      # if it was created successfully
      if voted_post.valid?
        # render 
        render json: voted_post, status: :ok
      else
        # Tell the user why they couldn't like that post
        render json: { errors: voted_post.errors.full_messages }
      end
    else
      # Tell the user they must be logged in to perform this action.
      render json: { message: "Please log in to vote on a post."}, status: :unauthorized
    end
  end

  def update
    # If the user is logged in
    if current_user
      # Find the post
      params.permit(:post_id)
      voted_post = VotedPost.find_by(user_id: current_user.id, post_id: params["post_id"])
      # byebug
      # Swap the state of the voted post
      voted_post.update!(voted_post_params)
      # render
      render json: voted_post, status: :ok
    else
      # Tell the user they must be logged in to perform this action.
      render json: { message: "Please log in to change your vote on a post."}, status: :unauthorized
    end
  end

  def destroy
    # If the user is logged in
    if current_user
      # grab the post
      voted_post = voted_post = VotedPost.find_by(user_id: current_user.id, post_id: params["post_id"])
      # delete that post
      VotedPost.destroy(voted_post.id)
      # render
      render json: { message: "#{current_user.username} has removed their vote from post: #{voted_post.post.title}"}, status: :ok
    else
      # Tell the user they must be logged in to perform this action.
      render json: { message: "Please log in to remove your vote on a post."}, status: :unauthorized
    end
  end

  private

  def voted_post_params
    params.permit(:state, :post_id)
  end

end

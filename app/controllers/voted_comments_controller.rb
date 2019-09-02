class VotedCommentsController < ApplicationController

  def index
    # If the user is logged in
    if current_user
      # grab all of their voted comments
      comments = current_user.voted_comments
      # If they have liked any comments
      if comments.length > 0
        # render their comments
        render json: comments, status: :ok
      else
        # Tell them they should start liking people's comments
        render json: { message: "It looks like you haven't liked any comments yet."}
      end
    else
      # Tell the user they must be logged in to see their voted comments
      render json: { message: "Please log in to see the comments you've voted for."}, status: :unauthorized
    end
  end

  def create
    # If the user is logged in
    if current_user
      # Create the voted_comment
      # byebug
      voted_comment = current_user.voted_comments.create(voted_comment_params)
      # if it was created successfully
      if voted_comment.valid?
        # render 
        render json: voted_comment, status: :ok
      else
        # Tell the user why they couldn't like that comment
        render json: { errors: voted_comment.errors.full_messages }
      end
    else
      # Tell the user they must be logged in to perform this action.
      render json: { message: "Please log in to vote on a comment."}, status: :unauthorized
    end
  end

  def update
    # If the user is logged in
    if current_user
      # Find the comment
      params.permit(:comment_id)
      voted_comment = current_user.voted_comments.find_by(comment_id: params["comment_id"])
      # If we found the right comment
      if voted_comment
        # Swap the state of the voted comment
        voted_comment.update!(voted_comment_params)
        # render
        render json: voted_comment, status: :ok
      else
        # Tell the user that something went wrong
        render json: { message: "Sorry! Something went wrong.", errors: ["You might have given us the wrong comment."]}, status: :bad_request
      end
    else
      # Tell the user they must be logged in to perform this action.
      render json: { message: "Please log in to change your vote on a comment."}, status: :unauthorized
    end
  end

  def destroy
    # If the user is logged in
    if current_user
      # grab the comment
      params.permit(:comment_id)
      voted_comment = current_user.voted_comments.find_by(comment_id: params["comment_id"])
      # If we found the right comment
      if voted_comment
        # delete that comment
        VotedComment.destroy(voted_comment.id)
        # render
        render json: { message: "#{current_user.username} has removed their vote from comment: #{voted_comment.comment.content}"}, status: :ok
      else
        # Tell the user that something went wrong
        render json: { message: "Sorry! Something went wrong.", errors: ["You can't take away a vote from a comment if you haven't voted for.", "You might have given us the wrong comment."]}, status: :bad_request
      end
    else
      # Tell the user they must be logged in to perform this action.
      render json: { message: "Please log in to remove your vote on a comment."}, status: :unauthorized
    end
  end

  private

  def voted_comment_params
    params.permit(:state, :comment_id)
  end

end

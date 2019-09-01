class CommentsController < ApplicationController
  def index
    # find all the comments
    comments = Comment.all
    # render all comments
    render json: comments, status: :ok
  end

  def show
    # find one comment
    comment = Comment.find(params["id"])
    # render comment
    render json: comment, status: :ok
  end

  # Beyond this point, user must be logged in...
  def create
    # If the user is logged in
    if current_user
      # create a comment
      comment = current_user.comments.create(comment_params)
      # If the comment was made
      if comment.valid?
        # show that comment
        render json: comment, status: :ok
      else
        # Tell the user about the errors
        render json: { errors: comment.errors.full_messages }, status: :bad_request
      end
    else
      # Tell the user to log in to create a comment
      render json: { message: "Please log in to post a comment."}, status: :unauthorized
    end
  end

  def destroy
        # If the user is logged in
        if current_user
          # find the comment 
          comment = Comment.find(params["id"])
          # If the user created this comment
          if current_user == comment.user
            # destroy the comment
            comment.destroy
            # tell the user this was a success
            render json: { message: "Successfully deleted!", removed: comment }, status: :ok
          else
            # Tell the user they aren't allowed to perform this action
            render json: { message: "You can only delete comments you've created!!"}, status: :unauthorized
          end
        else
          # Tell the user to log in to delete
          render json: { message: "Please log in to delete a comment."}, status: :unauthorized
        end
  end

  private
  def comment_params
    params.permit(:content, :post_id)
  end

end

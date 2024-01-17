class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to seichi_path(comment.seichi_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, seichi_id: params[:seichi_id])
  end

end


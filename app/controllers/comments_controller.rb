class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.create(comment_params)
    redirect_to seichi_path(comment.seichi_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    seichi_id = @comment.seichi_id
    if user_signed_in? && current_user.id == @comment.user_id
      @comment.destroy
    end
    redirect_to seichi_path(seichi_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, seichi_id: params[:seichi_id])
  end

end


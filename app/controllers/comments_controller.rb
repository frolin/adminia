class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new comment_params
    @comment.user_id = current_user.id
    @comment.save
    redirect_to issue_path(@commentable), notice: 'Комментарий добавленэ'
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end


end

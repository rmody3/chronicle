class CommentsController < ApplicationController
  def create
    byebug
    @chronicle = Chronicle.find(params[:chronicle_id])
    @comment = Comment.create(comment_params)
    @comment.account_id = current_account.id
    @comment.chronicle_id = @chronicle.id
    @comment.save
    byebug
    redirect_to 'chronicle_path(@chronicle)'

  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end

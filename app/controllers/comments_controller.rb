class CommentsController < ApplicationController
  def create
    @chronicle = Chronicle.find(comment_params[:chronicle_id])
    @comment = Comment.create(comment_params)
    @comment.account_id = current_account.id
    @comment.save
    redirect_to chronicle_path(@chronicle)

  end

  private
  def comment_params
    params.require(:comment).permit(:content, :chronicle_id, :account_id, :upvotes)
  end
end

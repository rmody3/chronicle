class CommentVotesController < ApplicationController
		def create
		@account = Account.find(current_account.id)
		@comment = Comment.find(comment_vote_params[:comment_id])
		@chronicle = Chronicle.find(comment_vote_params[:chronicle_id])

		if comment_vote_params[:downvote]
			unless CommentVote.find_by(account_id: @account.id) && CommentVote.find_by(account_id: @account.id).downvote == true
				@comment_vote = CommentVote.find_or_create_by(account_id: @account.id, comment_id: @comment.id)
				@comment_vote.downvote = true
				@comment.downvotes += 1
				if @comment_vote.upvote == true
					@comment.upvotes -= 1
					@comment_vote.upvote = false
				end
				# @comment_vote.check_and_reset_votes
				# uncomment the above line if we want to show sum of upvotes and downvotes
				@comment_vote.save
			end
		elsif comment_vote_params[:upvote]
			unless CommentVote.find_by(account_id: @account.id) && CommentVote.find_by(account_id: @account.id).upvote == true
				@comment_vote = CommentVote.find_or_create_by(account_id: @account.id, comment_id: @comment.id)
				@comment_vote.upvote = true
				@comment.upvotes += 1
				
				if @comment_vote.downvote == true
					@comment.downvotes -= 1
					@comment_vote.downvote = false
				end
				# @comment_vote.check_and_reset_votes
				# uncomment the above line if we want to show sum of upvotes and downvotes
				@comment_vote.save
			end
		end
		@comment.save
		redirect_to chronicle_path(@chronicle)
	end

	private

	def comment_vote_params
		params.require(:comment_vote).permit(:downvote, :upvote, :comment_id, :chronicle_id)
	end
end

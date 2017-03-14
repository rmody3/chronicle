class ChronicleVotesController < ApplicationController
	def create
		@account = Account.find(current_account.id)
		@chronicle = Chronicle.find(chronicle_vote_params[:chronicle_id])

		if chronicle_vote_params[:downvote]
			unless ChronicleVote.find_by(account_id: @account.id) && ChronicleVote.find_by(account_id: @account.id).downvote == true
				@chronicle_vote = ChronicleVote.find_or_create_by(account_id: @account.id, chronicle_id: @chronicle.id)
				@chronicle_vote.downvote = true
				@chronicle.downvotes += 1
				if @chronicle_vote.upvote == true
					@chronicle.upvotes -= 1
					@chronicle_vote.upvote = false
				end
				# @chronicle_vote.check_and_reset_votes
				# uncomment the above line if we want to show sum of upvotes and downvotes
				@chronicle_vote.save
			end
		elsif chronicle_vote_params[:upvote]
			unless ChronicleVote.find_by(account_id: @account.id) && ChronicleVote.find_by(account_id: @account.id).upvote == true
				@chronicle_vote = ChronicleVote.find_or_create_by(account_id: @account.id, chronicle_id: @chronicle.id)
				@chronicle_vote.upvote = true
				@chronicle.upvotes += 1
				
				if @chronicle_vote.downvote == true
					@chronicle.downvotes -= 1
					@chronicle_vote.downvote = false
				end
				# @chronicle_vote.check_and_reset_votes
				# uncomment the above line if we want to show sum of upvotes and downvotes
				@chronicle_vote.save
			end
		end
		@chronicle.save
		redirect_to chronicle_path(@chronicle)
	end

	private

	def chronicle_vote_params
		params.require(:chronicle_vote).permit(:downvote, :upvote, :chronicle_id)
	end
end

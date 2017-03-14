class ChronicleVotesController < ApplicationController
	def create
		byebug
	end

	private

	def chronicle_vote_params
		params.require(:chronicle_vote).permit(:downvote, :upvote)
	end
end

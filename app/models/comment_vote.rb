class CommentVote < ApplicationRecord
	belongs_to :comment
	belongs_to :account

	# uncomment this method if we decide to only show "sum of upvotes and downvotes" instead of showing them individually 
	# def check_and_reset_votes
	# 	if self.downvote == true && self.upvote == true
	# 		self.downvote = false
	# 		self.upvote = false
	# 	end
	# end
end

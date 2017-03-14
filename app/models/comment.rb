class Comment < ApplicationRecord
  belongs_to :chronicle
  belongs_to :account
  has_many :comment_votes
end

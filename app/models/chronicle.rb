class Chronicle < ApplicationRecord
  has_many :subscriptions
  has_many :accounts, through: :subscriptions
  has_many :article_chronicles
  has_many :articles, through: :article_chronicles
  has_many :chronicle_tags
  has_many :tags, through: :chronicle_tags
  has_many :comments
  has_many :chronicle_votes
  has_many :votes, through: :chronicle_votes

  attr_reader :upvote, :downvote

  def initialize
    super
    @upvote = 0
    @downvote = 0
  end

  def self.search(search_term)
    chronicle_match = Chronicle.joins(:tags).where('tags.name ILIKE ? AND private = ?',  "%#{search_term}%", false)
    chronicle_match += Chronicle.where('name ILIKE ? AND private = ?', "%#{search_term}%", false)
  end

  def upvote
    @upvote += 1
  end

  def downvote
    @downvote -= 1
  end

  def vote
    @upvote + @downvote
  end

end

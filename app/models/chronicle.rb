class Chronicle < ApplicationRecord
  has_many :subscriptions
  has_many :accounts, through: :subscriptions
  has_many :article_chronicles
  has_many :articles, through: :article_chronicles
  has_many :chronicle_tags
  has_many :tags, through: :chronicle_tags
  has_many :comments

  validates :visibility, inclusion: {in: ["public", "private"]}

  def self.search(search_term)
    chronicle_match = Chronicle.joins(:tags).where('tags.name ILIKE ? AND public = ?',  "%#{search_term}%", 1)
    chronicle_match += Chronicle.where('title ILIKE ? AND public = ?', "%#{search_term}%", 1)
  end
end

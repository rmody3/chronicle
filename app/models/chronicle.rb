class Chronicle < ApplicationRecord
  has_many :subscriptions
  has_many :accounts, through: :subscriptions
  has_many :article_chronicles
  has_many :articles, through: :article_chronicles
  has_many :chronicle_tags
  has_many :tags, through: :chronicle_tags
  has_many :comments

  def self.search(search_term)
    chronicle_match = Chronicle.joins(:tags).where('tags.name ILIKE ? AND private = ?',  "%#{search_term}%", false)
    chronicle_match += Chronicle.where('name ILIKE ? AND private = ?', "%#{search_term}%", false)
  end
end

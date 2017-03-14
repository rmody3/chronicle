class Chronicle < ApplicationRecord
  has_many :subscriptions
  has_many :accounts, through: :subscriptions
  has_many :article_chronicles
  has_many :articles, through: :article_chronicles
  has_many :chronicle_tags
  has_many :tags, through: :chronicle_tags
  has_many :comments
  has_many :chronicle_votes


  def self.search(search_term)
    chronicle_match = Chronicle.joins(:tags).where('tags.name ILIKE ? AND private = ?',  "%#{search_term}%", false)
    chronicle_match += Chronicle.where('name ILIKE ? AND private = ?', "%#{search_term}%", false)
    chronicle_match.uniq
    # chronicle_match += Chronicle.joins(:subscriptions).where('chronicle.name ILIKE ? AND subscriptions.admin_id = ? AND private = ?', "%#{search_term}%", current_account.id, true )
    # chronicle doesnt know the current_account method..
  end


end

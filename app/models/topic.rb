class Topic < ApplicationRecord
  has_many :subscriptions
  has_many :accounts, through: :subscriptions
  has_many :article_topics
  has_many :articles, through: :article_topics
  has_many :topic_tags
  has_many :tags, through: :topic_tags
  has_many :comments

  validates :type, inclusion: {in: ["public", "private"]}
end

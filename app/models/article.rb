class Article < ApplicationRecord
  has_many :article_topics
  has_many :topics, through: :article_topics
end

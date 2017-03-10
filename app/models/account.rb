class Account < ApplicationRecord
  has_many :topics
  has_many :articles, through: :topics
  has_secure_password
end

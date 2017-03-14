class Account < ApplicationRecord
  has_many :chronicles
  has_many :articles, through: :chronicles
  has_many :chronicle_votes
  has_many :comment_votes
  has_secure_password

  validates :name, presence: true , uniqueness: true, length: {in: 2..20}
  validates :email, presence: true, uniqueness: true, format: { with:/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i }
  validates :password, presence: true, confirmation: true
  validates_length_of :password, in: 6..20, on: :create
  validates_confirmation_of :password, :message => "passwords don't match" #password confirmation isn't working
  validates :bio, length: {in: 0..1000}


end

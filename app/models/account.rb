class Account < ApplicationRecord
  has_many :topics
  has_many :articles, through: :topics
  has_secure_password

#   EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
#   validates :name, :presence => true, :uniqueness => true, :length => {2..20}
#   validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
#   validates :password, :confirmation => true
#   validates_length_of :password, :in => 6..20, :on => :create
#   validates :bio, :presence => true, :length => {0..1000}
#
# #Not 100% sure the below is entirely necessary b/c has_secure_password
#   before_save :encrypt_password
#   after_save :clear_password
#
#   def encrypt_password
#     if password.present?
#       self.salt = BCrypt::Engine.generate_salt
#       self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
#     end
#   end
#   def clear_password
#     self.password = nil
#   end

end

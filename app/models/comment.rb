class Comment < ApplicationRecord
  belongs_to :chronicle
  belongs_to :account
end

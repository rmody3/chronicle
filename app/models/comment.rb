class Comment < ApplicationRecord
  belongs_to :topic
  belongs_to :account
end

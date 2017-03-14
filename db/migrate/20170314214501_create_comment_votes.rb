class CreateCommentVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_votes do |t|
      t.integer :comment_id
      t.integer :account_id
      t.boolean :upvote, default: false
      t.boolean :downvote, default: false

      t.timestamps
    end
  end
end

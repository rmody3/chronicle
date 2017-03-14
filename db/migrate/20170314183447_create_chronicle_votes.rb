class CreateChronicleVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :chronicle_votes do |t|
      t.integer :chronicle_id
      t.integer :account_id
      t.boolean :upvote
      t.boolean :downvote

      t.timestamps
    end
  end
end
